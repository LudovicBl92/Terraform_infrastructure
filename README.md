This is the first directory where I use Terraform and its modules to provision resources.

# AWS VPC creation

This module provision AWS VPC with an Internet Gateway and two Subnets.

# AWS SECURITY-GROUP creation

This module provision AWS security group with the associated rules.

# AWS EC2 creation

This module provision aws template and 2 ec2.

# AWS ALB creation

This module provision AWS loadbalancer.
## Usage

```hcl
module "<VPC>" {
    source             = "./modules/VPC"
    cidr_block         = "YOUR CIDR BLOCK"
    name_vpc           = "YOUR VPC NAME"
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

module "EC2_module" {
    source             = "./modules/EC2"
    template_name      = "YOUR TEMPLATE NAME"
    id_image           = "AMI ID"
    type_instance      = "INSTANCE TYPE"
    key                = "YOUR KEY"
    version_template   = "1.0"
    first_sg_id        = "${module.SECURITY_GROUP_module.first_sg_id}"
    primary-subnet     = "${module.VPC_module.primary-subnet_id}"
    ec2_name1          = "FIRST EC2 NAME"
    ec2_name2          = "SECOND EC2 NAME"
}

module "ALB_module" {
    source            = "./modules/ALB"
    target_group_name = "TARGET GROUP NAME"
    port_define       = "80 BY DEFAULT"
    protocol_define   = "HTTP BY DEFAULT"
    id_vpc            = "${module.VPC_module.VPC_ID}"
    lb_name           = "LOAD-BALANCER NAME"
    first_sg_id       = "${module.SECURITY_GROUP_module.first_sg_id}"
    primary-subnet    = "${module.VPC_module.primary-subnet_id}"
    second-subnet     = "${module.VPC_module.secondary-subnet_id}"
    ec2_id1           = "${module.EC2_module.ec2_id1}"
    ec2_id2           = "${module.EC2_module.ec2_id2}"
}