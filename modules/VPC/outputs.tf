output "VPC_name" {
    description = "VPC name"
    value       = aws_vpc.main.tags.Name
}
output "primary-subnet_name" {
    description = "Subnet1 name"
    value       = aws_subnet.primary-subnet.tags.Name
}
output "second-subnet_name" {
    description = "Subnet2 name"
    value       = aws_subnet.second-subnet.tags.Name
}