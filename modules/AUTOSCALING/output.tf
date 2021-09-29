output "autoscaling_name" {
  description = "aws_autoscaling_group_name"
  value       = aws_autoscaling_group.autoScalingGroup.name
}

output "autoscalingPolicy_name" {
  description = "aws_autoscaling_group_name"
  value       = aws_autoscaling_policy.autoscalingPolicy.arn
}
