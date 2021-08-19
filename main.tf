module "VPC_module" {
    source     = "./modules/VPC"
    cidr_block = "10.0.0.0/16"
    name_vpc   = "Projet_VPC"
}