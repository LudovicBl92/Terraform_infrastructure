output "engine_target" {
  description = "engine_target"
  value       = aws_db_instance.BDD.engine
}

output "engine_version_target" {
  description = "engine_version_targe"
  value       = aws_db_instance.BDD.engine_version
}

output "name_BDD" {
  description = "name_BDD"
  value       = aws_db_instance.BDD.name
}