variable "autoscaling_name" {
  description = "autoscaling_name"
  type        = string
}

variable "template_id" {
  description = "template_id"
  type        = string
}

variable "minimum_size" {
  description = "minimum_size"
  type        = number
}

variable "wanted_capacity" {
  description = "wanted_capacity"
  type        = number
}

variable "maximum_size" {
  description = "maximum_size"
  type        = number
}

variable "cooldown_value" {
  description = "cooldown_value"
  type        = number
}

variable "lb_arn" {
  description = "lb_arn"
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

variable "version_template" {
  description = "version_template"
  type        = string
}

variable "tag_name" {
  description = "tag_name"
  type        = string
}

variable "autoscaling_policy_up" {
  description = "autoscaling_policy_up"
  type        = string
}

variable "autoscaling_policy_down" {
  description = "autoscaling_policy_down"
  type        = string
}

variable "value_adjustement_up" {
  description = "adjustment up"
  type        = string
}

variable "value_adjustement_down" {
  description = "adjustment down"
  type        = string
}
variable "healthcheck_period" {
  description = "healthcheck_period"
  type        = string
}