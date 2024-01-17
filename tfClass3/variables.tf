variable region {
  type        = string
  default     = "us-east-2"
  description = "aws env region"
}

variable instance_type {
  type        = string
  default     = "t2.micro"
  description = "default instance type"
}

variable desired_capacity {
  type        = number
    default     = "2"
  description = "desired capacity of ASG"
}

variable max_size {
  type        = number
  default     = "5"
  description = "max size for ASG"
}

variable min_size {
  type        = number
  default     = "1"
  description = "min size for ASG"
}

variable key_name {
  type        = string
  default     = "mylaptop-key"
  description = "keypair name"
}
variable sg_name {
  type        = string
  default     = "as-name"
  description = "defualt sg name"
}
