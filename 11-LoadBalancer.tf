resource "aws_lb" "PentaCryptapp1_alb" {
  name               = "PentaCryptapp1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.PentaCryptapp1_sg02_LB01.id]
  subnets            = [
    aws_subnet.public-ap-south-1a.id,
    aws_subnet.public-ap-south-1b.id,
    aws_subnet.public-ap-south-1c.id,
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name = "PentaCrypt-LoadBalancer"
    Service = "Application1"
    Owner = "Interoyal"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.PentaCryptapp1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.PentaCryptapp1_tg.arn
  }
}