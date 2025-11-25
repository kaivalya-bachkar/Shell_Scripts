#ALB
resource "aws_lb" "THIS_THREE_TIER_LB" {
  name               = "three-tier-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.web_security_group_id]
  subnets            = var.public_subnet_id

  tags = var.web_common_tags
}

resource "aws_lb_target_group" "THREE_TIER_TG" {
  name     = "three-tier-lb-tg"
  port     = var.web_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "TG_ATTACH_SERVER" {
  count = 2
  target_group_arn = var.target_group_arn
  target_id        = var.web_ins_id[count.index]
  port             = var.web_port

  depends_on = [var.web_ins_id]
}

resource "aws_lb_listener" "LB_LISTENER" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.web_port
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}
