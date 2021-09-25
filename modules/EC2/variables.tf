variable "template_name" {
  description = "name of the template"
  type        = string
}

variable "id_image" {
  description = "ID of the AMI"
  type        = string
}

variable "type_instance" {
  description = "instance type"
  type        = string
}

variable "key" {
  description = "SSH key"
  type        = string
}

variable "version_template" {
  description = "version of the template"
  type        = string
}

variable "first_sg_id" {
  description = "name of the security group"
  type        = string
}

variable "primary-subnet" {
  description = "ID of the primary subnet"
  type        = string
}

variable "ec2_name1" {
  description = "name of the first EC2"
  type        = string
}

variable "ec2_name2" {
  description = "name of the second EC2"
  type        = string
}