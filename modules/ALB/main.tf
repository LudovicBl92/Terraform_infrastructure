resource "aws_lb_target_group" "front_end" {
  name        = var.target_group_name
  port        = var.port_define
  protocol    = var.protocol_define
  target_type = "instance"
  vpc_id      = var.id_vpc
}

resource "aws_lb_target_group_attachment" "tg_group_attachment1" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = var.ec2_id1
  port             = var.port_define
}

resource "aws_lb_target_group_attachment" "tg_group_attachment2" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = var.ec2_id2
  port             = var.port_define
}
resource "aws_lb" "Loadbalancer" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.first_sg_id]

  subnets = [
    var.primary-subnet,
    var.second-subnet
  ]

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.Loadbalancer.arn
  port              = var.port_define
  protocol          = var.protocol_define

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}