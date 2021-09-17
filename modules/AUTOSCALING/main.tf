resource "aws_autoscaling_group" "autoScalingGroup" {
  name                      = "${var.template_name}-asg"
  min_size                  = var.minimum_size
  desired_capacity          = var.wanted_capacity
  max_size                  = var.maximum_size
  health_check_type         = "ELB"
  health_check_grace_period = var.healthcheck_period
  target_group_arns         = [var.lb_arn]

  vpc_zone_identifier = [
    var.second-subnet
  ]

  launch_template {
    id      = var.template_id
    version = var.version_template
  }

  tag {
    key                 = "Name"
    value               = var.tag_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "autoscalingPolicy" {
  name                   = var.autoscaling_policy_name
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.autoScalingGroup.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.value_target
  }
}