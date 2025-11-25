output "db_subnet_group" {
  value       = aws_db_subnet_group.subnet_group.name
}

output "random_password" {
  value       = random_password.password.result

}