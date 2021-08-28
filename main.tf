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
    id_vpc             = "${module.VPC_module.VPC_ID}"
    primary-subnet     = "${module.VPC_module.primary-subnet_id}"
    second-subnet      = "${module.VPC_module.secondary-subnet_id}"
    cidr_block_subnet1 = "${module.VPC_module.cidr_block_subnet1}"
}