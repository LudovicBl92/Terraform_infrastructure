variable "cidr_block" {
    description = "VPC CIDR block"
    type        = string
}

variable "name_vpc" {
    description = "VPC name"
    type        = string
}

variable "internet_gateway" {
    description = "Name of the Internet Gateway"
    type        = string
}

variable "primary-subnet" {
    description = "The name of the first subnet wanted"
    type        = string
}

variable "second-subnet" {
    description = "The name of the second subnet wanted"
    type        = string
}

variable "cidr_block_subnet1" {
    description = "Subnet CIDR block "
    type        = string
}

  variable "cidr_block_subnet2" {
    description = "Subnet CIDR block "
    type        = string
}

  variable "AZ-1" {
    description = "availibility zone for subnet1"
    type        = string
}

    variable "AZ-2" {
    description = "availibility zone for subnet2"
    type        = string
}