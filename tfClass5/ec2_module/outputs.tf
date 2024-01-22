output "public-Ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "ami" {
  value = aws_instance.ec2_instance.ami
}

output "az" {
  value = aws_instance.ec2_instance.availability_zone
}

output "instance_type" {
  value = aws_instance.ec2_instance.instance_type
}