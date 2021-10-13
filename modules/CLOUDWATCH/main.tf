
resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
  alarm_name          = var.lb_alarm_name_up
  comparison_operator = var.lb_comparison_operator_up
  evaluation_periods  = var.lb_period_evaluation
  metric_name         = var.lb_metric_name
  namespace           = var.lb_namespace
  period              = var.lb_period
  statistic           = var.lb_statistic
  threshold           = var.lb_threshold_up

  dimensions = {
    AutoScalingGroupName = var.lb_name
  }

  tags = {
    Name = "web_cpu_alarm_up"
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [var.autoscaling_policy_up]
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down" {
  alarm_name          = var.lb_alarm_name_down
  comparison_operator = var.lb_comparison_operator_down
  evaluation_periods  = var.lb_period_evaluation
  metric_name         = var.lb_metric_name
  namespace           = var.lb_namespace
  period              = var.lb_period
  statistic           = var.lb_statistic
  threshold           = var.lb_threshold_down

  dimensions = {
    AutoScalingGroupName = var.lb_name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = [var.autoscaling_policy_down]
}
