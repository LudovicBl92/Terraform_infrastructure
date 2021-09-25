output "first_sg_name" {
  description = "first_sg"
  value       = aws_security_group.first_sg.tags.Name
}

output "second_sg_name" {
  description = "second_sg"
  value       = aws_security_group.second_sg.tags.Name
}

output "first_sg_id" {
  description = "first_sg_id"
  value       = aws_security_group.first_sg.id
}

output "second_sg_id" {
  description = "second_sg_id"
  value       = aws_security_group.second_sg.id
}