output "alb_dns" {
  value = module.ALB.alb_dns
}

output "DB_PASSWORD" {
    value= module.DB_INSTANCE.random_password
    sensitive = true
}