variable "ec2_instance_name" {
  type        = list(string)
  default     = ["first ec2", "second ec2", "third ec2"]
  description = "description"
}

variable bucket_name {
  type        = list(string)
  default     = ["my-first-bucket", "my-second-bucket","my-third-bucket"]
  description = "description"
}
