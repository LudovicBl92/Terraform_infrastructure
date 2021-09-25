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
variable "third-subnet" {
  description = "The name of the third subnet wanted"
  type        = string
}
variable "fourth-subnet" {
  description = "The name of the third subnet wanted"
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
variable "cidr_block_subnet3" {
  description = "Subnet CIDR block "
  type        = string
}
variable "cidr_block_subnet4" {
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
variable "AZ-3" {
  description = "availibility zone for subnet3"
  type        = string
}

variable "nat_eip" {
  description = "EIP for the NAT Gateway"
  type        = string
}
variable "nat_gateway" {
  description = "NAT Gateway name"
  type        = string
}

variable "nat_eip_back" {
  description = "EIP for the NAT Gateway"
  type        = string
}
variable "nat_gateway_back" {
  description = "NAT Gateway name"
  type        = string
}