output "first_sg_name" {
    description = "first_sg"
    value       = aws_security_group.first_sg.tags.Name
}

output "second_sg_name" {
    description = "second_sg"
    value       = aws_security_group.second_sg.tags.Name
}