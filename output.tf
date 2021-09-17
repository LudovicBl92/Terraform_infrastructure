output "VPC_name" {
  description = "VPC name"
  value       = module.VPC_module.VPC_name
}
output "primary-subnet" {
  description = "Subnet1_name"
  value       = module.VPC_module.primary-subnet_name
}
output "second-subnet" {
  description = "Subnet2_name"
  value       = module.VPC_module.second-subnet_name
}

output "first_sg_name" {
  description = "first_sg_name"
  value       = module.SECURITY_GROUP_module.first_sg_name
}

output "second_sg_name" {
  description = "second_sg_name"
  value       = module.SECURITY_GROUP_module.second_sg_name
}

output "ec2_name1" {
  description = "ec2_name1"
  value       = module.EC2_module.ec2_name1
}

output "ec2_name2" {
  description = "ec2_name2"
  value       = module.EC2_module.ec2_name2
}

output "lb_name" {
  description = "lb_name"
  value       = module.ALB_module.lb_name
}

output "autoscaling_group_name" {
  description = "autoscaling_group_name"
  value       = module.AUTOSCALING_module.aws_autoscaling_group_name
}