output "vpc_id" {
  value       = aws_vpc.THIS_VPC.id
}

output "public_subnet_id" {
  value       = aws_subnet.public[*].id
}

output "private_subnet_id" {
  value       = aws_subnet.private[0].id
}

output "db_subnet_one_id" {
  value       = aws_subnet.private[2].id
}

output "db_subnet_two_id" {
  value       = aws_subnet.private[3].id
}
