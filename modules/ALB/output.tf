output "lb_name" {
  description = "lb_name"
  value       = aws_lb.Loadbalancer.name
}

output "lb_arn" {
  description = "lb_arn"
  value       = aws_lb_target_group.front_end.arn
}