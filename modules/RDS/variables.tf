variable "db_subnet_group_name" {
  description = "subnet db name"
  type        = string
}

variable "engine_target" {
  description = "engine"
  type        = string
}

variable "engine_version_target" {
  description = "engine version"
  type        = string
}

variable "instance_gabarit" {
  description = "gabarit"
  type        = string
}

variable "sg_bdd" {
  description = "security group BDD"
  type        = string
}

variable "storage_value" {
  description = "BDD storage"
  type        = number
}

variable "storage_max" {
  description = "maximum storage BDD"
  type        = number
}

variable "port_define" {
  description = "port"
  type        = number
}

variable "name_BDD" {
  description = "BDD name"
  type        = string
}

variable "user" {
  description = "BDD user"
  type        = string
}

variable "password" {
  description = "BDD password"
  type        = string
}

variable "third-subnet" {
  description = "third subnet"
  type        = string
}

variable "fourth-subnet" {
  description = "fourth subnet"
  type        = string
}