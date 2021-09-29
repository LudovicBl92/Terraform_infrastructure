variable "autoscaling_policy_name" {
  description = "autoscaling_policy_name"
  type        = string
}
variable "lb_alarm_name_down" {
  description = "lb_alarm_name_down"
  type        = string
}
variable "lb_name" {
  description = "lb_name"
  type        = string
}
variable "lb_alarm_name_up" {
  description = "lb alarm name"
  type        = string
}
variable "lb_description_alarm" {
  description = "lb alarm description "
  type        = string
}
variable "lb_metric_name" {
  description = "name lb metric"
  type        = string
}
variable "lb_period_evaluation" {
  description = "evaluation period for lb monitoring"
  type        = number
}
variable "lb_period" {
  description = "period for lb monitoring"
  type        = number
}
variable "lb_comparison_operator_up" {
  description = "metric comparison operator for lb"
  type        = string
}
variable "lb_comparison_operator_down" {
  description = "lb_comparison_operator_down"
  type        = string
}
variable "lb_namespace" {
  description = "namespace for lb"
  type        = string
}
variable "lb_statistic" {
  description = "statistic for lb"
  type        = string
}
variable "lb_threshold_up" {
  description = "lb threshold_up"
  type        = number
}
variable "lb_threshold_down" {
  description = "lb threshold_down"
  type        = number
}
variable "BDD_id" {
  description = "id of bdd"
  type        = string
}
variable "rds_alarm_name" {
  description = "rds alarm name"
  type        = string
}
variable "rds_description_alarm" {
  description = "rds alarm description"
  type        = string
}
variable "rds_comparison_operator" {
  description = "metric comparison operator for rds"
  type        = string
}
variable "rds_period_evaluation" {
  description = "evaluation period for rds monitoring"
  type        = number
}
variable "rds_metric_name" {
  description = "name of the metric for rds"
  type        = string
}
variable "rds_namespace" {
  description = "namespace for rds"
  type        = string
}
variable "rds_period" {
  description = "period for rds monitoring"
  type        = number
}
variable "rds_statistic" {
  description = "statistic for rds"
  type        = string
}
variable "rds_threshold" {
  description = "threshold for rds"
  type        = number
}
