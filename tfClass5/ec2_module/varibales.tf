variable region {
  type        = string
  default     = "us-east-1"
  description = "region"
}

variable number_of_instances {
  type        = number
  default     = 1
  description = "number of ec2 instances"
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