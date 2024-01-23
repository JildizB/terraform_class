# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_instance" "web" {
#   count = local.ec2_instance == "true" ? 1 : 0
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = var.ec2_instance_name[count.index]
#   }
# }

# resource "aws_s3_bucket" "example" {
#   count = length(var.bucket_name)
#   bucket = var.bucket_name[count.index]

#   tags = {
#     Name        = "${var.bucket_name[count.index]}"
#     Environment = "dev"
#   }
# }

resource "aws_instance" "imported_ec2" {
  instance_type = "t2.micro"
  ami = "ami-0a3c3a20c09d6f377"
  key_name = "adilet_laptop_key"
}