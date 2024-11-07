resource "aws_subnet" "Public_Subnet1" {
  vpc_id     = var.vpc_id
  cidr_block = var.Public_Subnet1_cidr
  availability_zone = var.Availabillity_Zone1
  tags = {
    Name = "Public Subnet1"
  }
}
output "Public_Subnet1_id" {
  value = aws_subnet.Public_Subnet1.id
  
}