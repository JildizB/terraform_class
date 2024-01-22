resource "aws_instance" "ec2_instance" {
    count = var.number_of_instances
    ami = var.instance_ami
    instance_type = var.instance_type
    vpc_id = var.vpc_id

    tags = {
        Name = var.instance_name
    }
}