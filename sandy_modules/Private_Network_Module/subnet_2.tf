resource "aws_subnet" "private_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.Private_Subnet2_cidr
  availability_zone = var.Availabillity_Zone2  # Change to your desired AZ (can be the same AZ or another)
  map_public_ip_on_launch = false   # Ensure it's private (no public IPs)

  tags = {
    Name = "Sandy-Private-Subnet-2"
  }
}

# Step 4: Create a Route Table (no internet access)
resource "aws_route_table" "private_route_table_2" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Private-Route-Table-2"
  }
}
output "Sandy_Subnet2_Id" {
 value =  aws_subnet.private_subnet_2.id
}