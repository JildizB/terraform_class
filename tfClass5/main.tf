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

module "ec2_module" {
    source = "./ec2_module"
    region = "us-east-1"
    instance_ami = data.aws_ami.ubuntu.id
    instance_name = "module-ec2"
    sg_id = [aws_security_group.example.id]
}

output "public_ip" {
    value = module.ec2_module.public-Ip
}