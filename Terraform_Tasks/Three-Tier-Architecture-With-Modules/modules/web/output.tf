output "web_security_group_id" {
  value       = aws_security_group.web_sg.id
}

output "web_key_pair" {
  value       = aws_key_pair.web_key_pair.key_name
}

output "web-ins-id" {
  value       = aws_instance.web-ins[*].id
}