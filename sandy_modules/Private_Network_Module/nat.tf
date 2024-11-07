resource "aws_eip" "nat_eip" {
}

# Step 6: Create the NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.Public_Subnet_id
}


# Step 8: Create Routes to Route Internet Traffic via NAT Gateway
resource "aws_route" "private_subnet_1_nat_route" {
  route_table_id         = aws_route_table.private_route_table_1.id
  destination_cidr_block = "0.0.0.0/0"  # Default route to internet
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

resource "aws_route" "private_subnet_2_nat_route" {
  route_table_id         = aws_route_table.private_route_table_2.id
  destination_cidr_block = "0.0.0.0/0"  # Default route to internet
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

# Step 9: Associate the Route Table with the Private Subnets
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table_2.id
}