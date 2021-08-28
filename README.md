This is the first directory where I use Terraform and its modules to provision resources.

# AWS VPC creation

This module provisions AWS VPC with an Internet Gateway and two Subnets.

## Usage

```hcl
module "<VPC>" {
    source 	           = "./modules/VPC"
    cidr_block         = "YOUR CIDR BLOCK"
    name_vpc 	       = "YOUR VPC NAME"
    internet_gateway   = "INTERNET GATEWAY NAME"
    primary-subnet     = "PRIMARY SUBNET NAME"
    cidr_block_subnet1 = "CIDR BLOCK PRIMARY SUBNET"
    AZ-1               = "AZ USE FOR PRIMARY SUBNET"
    second-subnet      = "SECOND SUBNET NAME"
    cidr_block_subnet2 = "CIDR BLOCK SECOND SUBNET"
    AZ-2               = "AZ USE FOR SECOND SUBNET"
}

module "SECURITY_GROUP_module" {
    source             = "./modules/Security"
    first_sg           = "FIRST SECURITY GROUP NAME"
    second_sg          = "SECOND SECURITY GROUP NAME" 
    id_vpc             = "${module.VPC_module.VPC_ID}"
    primary-subnet     = "${module.VPC_module.primary-subnet_id}"
    second-subnet      = "${module.VPC_module.secondary-subnet_id}"
    cidr_block_subnet1 = "${module.VPC_module.cidr_block_subnet1}"
}
