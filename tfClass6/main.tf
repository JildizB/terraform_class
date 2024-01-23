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
#   count = length(var.ec2_instance_name)
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = var.ec2_instance_name[count.index]
#   }
# }

# variable "instance_details" {
#   type = map(object({
#     ami           = string
#     instance_type = string
#     key_name      = string
#   }))
#   default = {
#     web = {
#       ami           = "ami-fsdfgdh"
#       instance_type = "t2.micro"
#       key_name      = "my-key"
#     },
#     dev = {
#       ami           = "ami-fsdfgdh"
#       instance_type = "t3.micro"
#       key_name      = "dev-key"
#     }
#   }
# }


# resource "aws_instance" "example" {
#   for_each = var.instance_details

#   ami           = each.value.ami
#   instance_type = each.value.instance_type
#   key_name      = each.value.key_name
# }
