variable "first_sg" {
  description = "The name of the first security group"
  type        = string
}

variable "second_sg" {
  description = "The name of the second security group"
  type        = string
}

variable "id_vpc" {
  description = "ID of the VPC"
  type        = string
}

variable "primary-subnet" {
  description = "Primary Subnet"
  type        = string
}

variable "second-subnet" {
  description = "Second-subnet"
  type        = string
}

variable "cidr_block_subnet1" {
  description = "cidr_block_subnet1"
  type        = string
}

variable "cidr_block_subnet2" {
  description = "cidr_block_subnet2"
  type        = string
}

variable "cidr_block_subnet3" {
  description = "cidr_block_subnet3"
  type        = string
}

variable "cidr_block_subnet4" {
  description = "cidr_block_subnet4"
  type        = string
}

variable "ingress_rules_Pub" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "SSH"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "HTTP"
    }
  ]
}

variable "egress_rules_Pub" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
  default = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "HTTPS"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "HTTP"
    },
    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_block  = "0.0.0.0/0"
      description = "ICMP"
    }
  ]
}

variable "egress_rules_Pub_to_Priv" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH_BDD"
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "Access_BBD"
    }
  ]
}

variable "ingress_rules_NAT" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MYSQL"
    }
  ]
}

variable "egress_rules_NAT" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
  default = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "HTTPS"
    }
  ]
}