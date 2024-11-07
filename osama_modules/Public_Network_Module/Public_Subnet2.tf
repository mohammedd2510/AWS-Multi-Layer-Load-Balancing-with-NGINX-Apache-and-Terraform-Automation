resource "aws_subnet" "Public_Subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = var.Public_Subnet2_cidr
  availability_zone = var.Availabillity_Zone2
  tags = {
    Name = "Public Subnet2"
  }
}

output "Public_Subnet2_id" {
  value = aws_subnet.Public_Subnet2.id
  
}