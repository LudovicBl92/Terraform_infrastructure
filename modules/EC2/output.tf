output "template_name" {
  description = "template_name"
  value       = aws_launch_template.web_template.name
}

output "ec2_name1" {
  description = "ec2_name1"
  value       = aws_instance.EC2_WEB.tags.Name
}

output "ec2_name2" {
  description = "ec2_name2"
  value       = aws_instance.EC2_WEB2.tags.Name
}

output "ec2_id1" {
  description = "ec2_id1"
  value       = aws_instance.EC2_WEB.id
}

output "ec2_id2" {
  description = "ec2_id2"
  value       = aws_instance.EC2_WEB2.id
}

output "template_id" {
  description = "template_id"
  value       = aws_launch_template.web_template.id
}