variable region {
  type        = string
  default     = "us-east-1"
  description = "region"
}


variable instance_ami {
  type        = string
  default     = ""
  description = "instance ami"
}

variable instance_type {
  type        = string
  default     = "t2.micro"
  description = "description"
}

variable instance_name {
  type        = string
  default     = "ec2-instance"
  description = "ec2 instance name"
}

variable sg_id {
  type        = list(string)
  description = "sg for ec2 instance"
}
