variable "target_group_name" {
  description = "target_group_name"
  type        = string
}

variable "port_define" {
  description = "port"
  type        = string
}

variable "protocol_define" {
  description = "protocol"
  type        = string
}

variable "id_vpc" {
  description = "id_vpc"
  type        = string
}

variable "lb_name" {
  description = "lb_name"
  type        = string
}

variable "first_sg_id" {
  description = "first_sg_id"
  type        = string
}

variable "primary-subnet" {
  description = "primary-subnet"
  type        = string
}

variable "second-subnet" {
  description = "second-subnet"
  type        = string
}

variable "ec2_id1" {
  description = "ec2_id1"
  type        = string
}

variable "ec2_id2" {
  description = "ec2_id2"
  type        = string
}