output "rds_instance_id" {
  description = "id of mysql RDS instance"
  value       = aws_db_instance.mysql.id
}

output "rds_instance_dbname" {
  description = "name of mysql db"
  value       = aws_db_instance.mysql.name
}

output "rds_instance_dbuser" {
  description = "username of mysql db user"
  value       = aws_db_instance.mysql.username
}

output "rds_instance_address" {
  description = "address of mysql RDS instance"
  value       = aws_db_instance.mysql.address
}

output "rds_instance_endpoint" {
  description = "endpoint address of mysql RDS instance"
  value       = aws_db_instance.mysql.endpoint
}

output "security_group_rds" {
  description = "id of mysql security group"
  value       = aws_security_group.rds.id
}
