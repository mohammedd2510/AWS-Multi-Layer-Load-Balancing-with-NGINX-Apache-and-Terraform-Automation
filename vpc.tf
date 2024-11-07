resource "aws_vpc" "my-vpc" {
    cidr_block = var.cidr_blocks["vpc_cidr"]
    tags = {
        Name = "my-vpc"
    }
  
}