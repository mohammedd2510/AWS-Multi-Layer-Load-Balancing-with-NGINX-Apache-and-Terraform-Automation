# terraform.tfvars

cidr_blocks = {
  vpc_cidr        = "10.0.0.0/16"
  public_subnet1_cidr   = "10.0.48.0/20"
  public_subnet2_cidr  = "10.0.64.0/20"
  private_subnet1_cidr   = "10.0.16.0/20"
  private_subnet2_cidr= "10.0.32.0/20"
}
Availabillity_Zones = [ "us-east-1a","us-east-1b" ]
