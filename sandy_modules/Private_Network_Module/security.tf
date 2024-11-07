resource "aws_security_group" "Private_Security_Group" {
  name        = "Private_Security_Group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "Private-Security-Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Private_Security_Group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Private_Security_Group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
output "Private_Subnet1_Id" {
 value =  aws_subnet.private_subnet_1.id
}
output "security_Group_Id" {
 value =  aws_security_group.Private_Security_Group.id
}