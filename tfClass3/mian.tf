data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_launch_template" "my-launch-temp" {
  name_prefix                 = "my-launch"
  image_id                    = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.deployer.key_name
  user_data                   = filebase64("web-script.sh")
  vpc_security_group_ids      = [aws_security_group.example.id]
  
  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = 1

  launch_template {
    id      = aws_launch_template.my-launch-temp.id
    version = "$Latest"
  }
}

# create keypair 
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}
