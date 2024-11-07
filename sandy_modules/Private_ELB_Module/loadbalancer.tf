resource "aws_lb" "internal_alb" {
  name               = "sandy-alb"
  internal           = true
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.Private_Security_Group_id]
  subnets            = [var.Private_Subnet1_id, var.Private_Subnet2_id]

  enable_deletion_protection = false

  tags = {
    Name = "InternalALB"
  }
}
resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = var.elb_listener_port
  protocol = var.elb_listener_protocol
  vpc_id   = var.vpc_id

  health_check {
    protocol = var.elb_listener_protocol
    path     = "/"
    port     = var.elb_listener_port
    interval = 30
    timeout  = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "TargetGroup"
  }
}
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.internal_alb.arn
  port              = var.elb_listener_port
  protocol          = var.elb_listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}
resource "aws_lb_target_group_attachment" "ec2_instance_1_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = var.Ec2_1_id
  port             = var.elb_listener_port
}

resource "aws_lb_target_group_attachment" "ec2_instance_2_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = var.Ec2_2_id
  port             = var.elb_listener_port
}
output "private_elb_dns_name" {
  value = aws_lb.internal_alb.dns_name
  
}