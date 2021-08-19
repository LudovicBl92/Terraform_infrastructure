output "VPC_name" {
    description = "VPC name"
    value       = module.VPC_module.VPC_name
}
output "primary-subnet" {
    description = "Subnet1 name"
    value       = module.VPC_module.primary-subnet_name
}
output "second-subnet" {
    description = "Subnet1 name"
    value       = module.VPC_module.second-subnet_name
}