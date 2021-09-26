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
  third-subnet       = "subnet-PRIV"
  cidr_block_subnet3 = "10.0.3.0/24"
  fourth-subnet      = "subnet-PRIV2"
  cidr_block_subnet4 = "10.0.4.0/24"
  AZ-3               = "eu-west-3c"
  nat_eip            = "NAT_EIP"
  nat_gateway        = "NAT_GW"
  nat_eip_back       = "NAT_EIP2"
  nat_gateway_back   = "NAT_GW2"
}

module "SECURITY_GROUP_module" {
  source             = "./modules/Security"
  first_sg           = "SG_WEB"
  second_sg          = "SG_BACK"
  id_vpc             = module.VPC_module.VPC_ID
  primary-subnet     = module.VPC_module.primary-subnet_id
  second-subnet      = module.VPC_module.secondary-subnet_id
  cidr_block_subnet1 = module.VPC_module.cidr_block_subnet1
  cidr_block_subnet2 = module.VPC_module.cidr_block_subnet2
  cidr_block_subnet3 = module.VPC_module.cidr_block_subnet3
  cidr_block_subnet4 = module.VPC_module.cidr_block_subnet4
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
  minimum_size            = 1
  wanted_capacity         = 2
  maximum_size            = 4
  healthcheck_period      = 120
  lb_arn                  = module.ALB_module.lb_arn
  second-subnet           = module.VPC_module.secondary-subnet_id
  version_template        = "$Latest"
  tag_name                = "instance_ASG"
  autoscaling_policy_name = "Autoscaling-Policy"
  value_target            = 75
}

module "RDS_module" {
  source                = "./modules/RDS"
  db_subnet_group_name  = "sg_rds"
  engine_target         = "MariaDB"
  engine_version_target = "10.4.13"
  instance_gabarit      = "db.t2.micro"
  sg_bdd                = module.SECURITY_GROUP_module.second_sg_id
  storage_value         = 20
  storage_max           = 50
  port_define           = 3306
  name_BDD              = "MyDatabase"
  user                  = "userTest"
  password              = "passwordTest"
  third-subnet          = module.VPC_module.third-subnet_id
  fourth-subnet         = module.VPC_module.fourth-subnet_id
}