output "cloudwatch_alarm_up" {
  description = "lb_alarm_up"
  value       = aws_cloudwatch_metric_alarm.web_cpu_alarm_up.tags
}

output "cloudwatch_alarm_down" {
  description = "lb_alarm_down"
  value       = aws_cloudwatch_metric_alarm.web_cpu_alarm_down.tags
}