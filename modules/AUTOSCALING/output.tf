output "autoscaling_name" {
  description = "aws_autoscaling_group_name"
  value       = aws_autoscaling_group.autoScalingGroup.name
}

output "autoscalingPolicy_up" {
  description = "aws_autoscaling_group_up"
  value       = aws_autoscaling_policy.autoscalingPolicy_up.arn
}

output "autoscalingPolicy_down" {
  description = "aws_autoscaling_group_down"
  value       = aws_autoscaling_policy.autoscalingPolicy_down.arn
}