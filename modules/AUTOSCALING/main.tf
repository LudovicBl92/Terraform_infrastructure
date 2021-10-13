resource "aws_autoscaling_group" "autoScalingGroup" {
  name                      = var.autoscaling_name
  min_size                  = var.minimum_size
  desired_capacity          = var.wanted_capacity
  max_size                  = var.maximum_size
  health_check_type         = "ELB"
  health_check_grace_period = var.healthcheck_period
  target_group_arns         = [var.lb_arn]

  vpc_zone_identifier = [
    var.primary-subnet,var.second-subnet
  ]

  launch_template {
    id      = var.template_id
    version = var.version_template
  }
  
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
  tag {
    key                 = "Name"
    value               = var.tag_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "autoscalingPolicy_up" {
  name = var.autoscaling_policy_up
  scaling_adjustment = var.value_adjustement_up
  adjustment_type = "ChangeInCapacity"
  cooldown = var.cooldown_value
  autoscaling_group_name = aws_autoscaling_group.autoScalingGroup.name
}

resource "aws_autoscaling_policy" "autoscalingPolicy_down" {
  name = var.autoscaling_policy_down
  scaling_adjustment = var.value_adjustement_down
  adjustment_type = "ChangeInCapacity"
  cooldown = var.cooldown_value
  autoscaling_group_name = aws_autoscaling_group.autoScalingGroup.name
}