output "VPC_name" {
    description = "VPC name"
    value       = "${aws_vpc.main.tags.Name}"
}