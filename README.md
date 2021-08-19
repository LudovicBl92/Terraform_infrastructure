This is the first directory where I use Terraform and its modules to provision resources.

# AWS VPC creation

This module provisions AWS VPC for now. After i will integrate the subnet, SG, Instance.

## Usage

```hcl
module "<module name>" {
    source 	= "/modules/VPC"
    cidr_block  = "YOUR CIDR BLOCK"
    name_vpc 	= "YOUR VPC NAME"
}
