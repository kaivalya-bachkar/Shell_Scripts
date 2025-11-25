output "load_balancer_arn" {
  value       = aws_lb.THIS_THREE_TIER_LB.arn
}

output "target_group_arn" {
  value       = aws_lb_target_group.THREE_TIER_TG.arn
}

output "alb_dns" {
  value = aws_lb.THIS_THREE_TIER_LB.dns_name
}