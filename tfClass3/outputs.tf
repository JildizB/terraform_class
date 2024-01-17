output asgid {
  value       = aws_autoscaling_group.asg.id
  description = "asg id"
}

output asgaz {
  value       = aws_autoscaling_group.asg.availability_zones
  description = "asg AZ"
}