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

output "third-subnet_name" {
  description = "Subnet3 name"
  value       = aws_subnet.third-subnet.tags.Name
}

output "primary-subnet_id" {
  description = "Subnet1 id"
  value       = aws_subnet.primary-subnet.id
}

output "secondary-subnet_id" {
  description = "Subnet2 id"
  value       = aws_subnet.second-subnet.id
}

output "third-subnet_id" {
  description = "third id"
  value       = aws_subnet.third-subnet.id
}

output "cidr_block_subnet1" {
  description = "Subnet1 cidr_block"
  value       = aws_subnet.primary-subnet.cidr_block
}

output "cidr_block_subnet2" {
  description = "Subnet2 cidr_block"
  value       = aws_subnet.second-subnet.cidr_block
}

output "cidr_block_subnet3" {
  description = "Subnet3 cidr_block"
  value       = aws_subnet.third-subnet.cidr_block
}

output "fourth-subnet_name" {
  description = "Subnet4 name"
  value       = aws_subnet.fourth-subnet.tags.Name
}

output "fourth-subnet_id" {
  description = "fourth id"
  value       = aws_subnet.fourth-subnet.id
}

output "cidr_block_subnet4" {
  description = "Subnet4 cidr_block"
  value       = aws_subnet.fourth-subnet.cidr_block
}