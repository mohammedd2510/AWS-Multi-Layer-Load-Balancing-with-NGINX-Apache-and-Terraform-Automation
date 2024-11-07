# Application Load Balancer
resource "aws_lb" "app_lb" {
  name               = "Public-elb"
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.Public_Security_Group_id]
  subnets            = [var.Public_Subnet1_id, var.Public_Subnet2_id]
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = var.elb_listener_port
  protocol          = var.elb_listener_protocol

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.Nginx_target_group.arn
  }

  # Note: The listener does not directly control keep-alive but will use the connection timeout settings
}


# Output the ALB DNS name
output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}