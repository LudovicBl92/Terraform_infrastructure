module "VPC_module" {
  source             = "./modules/VPC"
  cidr_block         = "10.0.0.0/16"
  name_vpc           = "Projet_VPC"
  internet_gateway   = "IG_pub"
  primary-subnet     = "subnet-FRONT"
  cidr_block_subnet1 = "10.0.1.0/24"
  AZ-1               = "eu-west-3a"
  second-subnet      = "subnet-BACK"
  cidr_block_subnet2 = "10.0.2.0/24"
  AZ-2               = "eu-west-3b"
}

module "SECURITY_GROUP_module" {
  source             = "./modules/Security"
  first_sg           = "SG_WEB"
  second_sg          = "SG_BACK"
  id_vpc             = module.VPC_module.VPC_ID
  primary-subnet     = module.VPC_module.primary-subnet_id
  second-subnet      = module.VPC_module.secondary-subnet_id
  cidr_block_subnet1 = module.VPC_module.cidr_block_subnet1
}

module "EC2_module" {
  source           = "./modules/EC2"
  template_name    = "web_template"
  id_image         = "ami-0f7cd40eac2214b37"
  type_instance    = "t2.micro"
  key              = "AWS"
  version_template = "1.0"
  first_sg_id      = module.SECURITY_GROUP_module.first_sg_id
  primary-subnet   = module.VPC_module.primary-subnet_id
  ec2_name1        = "EC2_web1"
  ec2_name2        = "EC2_web2"
}

module "ALB_module" {
  source            = "./modules/ALB"
  target_group_name = "tg-front-end"
  port_define       = "80"
  protocol_define   = "HTTP"
  id_vpc            = module.VPC_module.VPC_ID
  lb_name           = "Loadbalancer-Web"
  first_sg_id       = module.SECURITY_GROUP_module.first_sg_id
  primary-subnet    = module.VPC_module.primary-subnet_id
  second-subnet     = module.VPC_module.secondary-subnet_id
  ec2_id1           = module.EC2_module.ec2_id1
  ec2_id2           = module.EC2_module.ec2_id2
}

module "AUTOSCALING_module" {
  source                  = "./modules/AUTOSCALING"
  template_name           = module.EC2_module.template_name
  template_id             = module.EC2_module.template_id
  minimum_size            = 2
  wanted_capacity         = 2
  maximum_size            = 2
  healthcheck_period      = 120
  lb_arn                  = module.ALB_module.lb_arn
  second-subnet           = module.VPC_module.secondary-subnet_id
  version_template        = "$Latest"
  tag_name                = "instance_ASG"
  autoscaling_policy_name = "Autoscaling-Policy"
  value_target            = 25
}