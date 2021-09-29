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

output "third-subnet" {
  description = "Subnet3_name"
  value       = module.VPC_module.third-subnet_name
}

output "fourth-subnet" {
  description = "Subnet4_name"
  value       = module.VPC_module.fourth-subnet_name
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
  value       = module.AUTOSCALING_module.autoscaling_name
}

output "name_BDD" {
  description = "name_BDD"
  value       = module.RDS_module.name_BDD
}

output "engine_target" {
  description = "engine_target"
  value       = module.RDS_module.engine_target
}

output "engine_version_target" {
  description = "engine_version_target"
  value       = module.RDS_module.engine_version_target
}

output "lb_alarm_up" {
  description = "lb_alarm_up"
  value       = module.CLOUDWATCH_module.cloudwatch_alarm_up
}

output "lb_alarm_down" {
  description = "lb_alarm_down"
  value       = module.CLOUDWATCH_module.cloudwatch_alarm_down
}