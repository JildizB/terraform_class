resource "aws_instance" "ec2_instance" {
    ami = var.instance_ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_id

    tags = {
        Name = var.instance_name
    }
}

