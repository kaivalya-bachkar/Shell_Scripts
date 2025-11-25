output "app_security_group_id" {
  value       = aws_security_group.app_sg.id
}

output "app_key_pair" {
  value       = aws_key_pair.app_key_pair.key_name
}