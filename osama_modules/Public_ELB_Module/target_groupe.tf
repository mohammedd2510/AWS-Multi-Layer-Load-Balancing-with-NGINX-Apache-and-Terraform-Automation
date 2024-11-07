resource "aws_lb_target_group" "Nginx_target_group" {
  name     = "Nginx-target-group"
  port     = var.elb_listener_port
  protocol = var.elb_listener_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "Nginx1_ec2_attachment" {
  target_group_arn = aws_lb_target_group.Nginx_target_group.arn
  target_id        = var.EC2_Nginx1_id
  port             = var.elb_listener_port
}

resource "aws_lb_target_group_attachment" "Nginx2_ec2_attachment" {
  target_group_arn = aws_lb_target_group.Nginx_target_group.arn
  target_id        = var.EC2_Nginx2_id
  port             = var.elb_listener_port
}
