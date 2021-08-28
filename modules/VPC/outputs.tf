output "VPC_name" {
    description = "VPC name"
    value       = aws_vpc.main.tags.Name
}

output "VPC_ID" {
    description = "VPC ID"
    value       = aws_vpc.main.id
}
output "primary-subnet_name" {
    description = "Subnet1 name"
    value       = aws_subnet.primary-subnet.tags.Name
}

output "second-subnet_name" {
    description = "Subnet2 name"
    value       = aws_subnet.second-subnet.tags.Name
}

output "primary-subnet_id" {
    description = "Subnet1 id"
    value       = aws_subnet.primary-subnet.id
}

output "secondary-subnet_id" {
    description = "Suubnet2 id"
    value       = aws_subnet.second-subnet.id
}

output "cidr_block_subnet1" {
    description = "Suubnet1 cidr_block"
    value       = aws_subnet.primary-subnet.cidr_block
}

output "cidr_block_subnet2" {
    description = "Suubnet2 cidr_block"
    value       = aws_subnet.second-subnet.cidr_block
}