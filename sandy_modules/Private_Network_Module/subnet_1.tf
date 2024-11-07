resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.Private_Subnet1_cidr
  availability_zone = var.Availabillity_Zone1 # Change to your desired AZ
  map_public_ip_on_launch = false  # Ensure it's private (no public IPs)

  tags = {
    Name = "Sandy-Private-Subnet-1"
  }
}

# Step 3: Create a Route Table (no internet access)
resource "aws_route_table" "private_route_table_1" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Private-Route-Table-1"
  }
}
output "Sandy_Subnet1_Id" {
 value =  aws_subnet.private_subnet_1.id
}