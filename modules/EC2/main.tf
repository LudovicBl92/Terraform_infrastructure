resource "aws_launch_template" "web_template" {
  name            = var.template_name
  image_id        = var.id_image
  instance_type   = var.type_instance
  key_name        = var.key
  default_version = var.version_template

  network_interfaces {
    security_groups = [var.first_sg_id]
    subnet_id       = var.primary-subnet
  }

  monitoring {
    enabled = true
  }

  user_data = filebase64("/modules/EC2/myscript.sh")
}

resource "aws_instance" "EC2_WEB" {

  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$Latest"
  }

  tags = {
    Name = var.ec2_name1
  }
}


resource "aws_instance" "EC2_WEB2" {

  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$Latest"
  }

  tags = {
    Name = var.ec2_name2
  }
}