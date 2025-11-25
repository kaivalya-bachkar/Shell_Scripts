resource "aws_lb" "THIS_THREE_TIER_LB" {
  name               = "three-tier-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  tags = var.common_tags
}

resource "aws_lb_target_group" "THREE_TIER_TG" {
  name     = "three-tier-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.THIS_VPC.id
}

resource "aws_lb_target_group_attachment" "TG_ATTACH_SERVER" {
  count = 2 
  target_group_arn = aws_lb_target_group.THREE_TIER_TG.arn
  target_id        = aws_instance.web-ins[count.index].id
  port             = 80

  depends_on = [aws_instance.web-ins]
}

resource "aws_lb_listener" "LB_LISTENER" {
  load_balancer_arn = aws_lb.THREE_TIER_LB.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.THREE_TIER_TG.arn
  }
}