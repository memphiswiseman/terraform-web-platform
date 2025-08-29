output "db_endpoint" {
  description = "Database endpoint"
  value       = aws_db_instance.app_db.endpoint
}

output "db_identifier" {
  value = aws_db_instance.app_db.id
}
