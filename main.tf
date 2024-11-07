module "Public_Network" {
    source = "./osama_modules/Public_Network_Module"
    vpc_id = aws_vpc.my-vpc.id
    Public_Subnet1_cidr= var.cidr_blocks["public_subnet1_cidr"]
    Public_Subnet2_cidr= var.cidr_blocks["public_subnet2_cidr"]
    Availabillity_Zone1 = var.Availabillity_Zones[0]
    Availabillity_Zone2 = var.Availabillity_Zones[1]
}
module "Private_Network" {
    source = "./sandy_modules/Private_Network_Module"
    vpc_id = aws_vpc.my-vpc.id
    Public_Subnet_id= module.Public_Network.Public_Subnet1_id
    Private_Subnet1_cidr= var.cidr_blocks["private_subnet1_cidr"]
    Private_Subnet2_cidr = var.cidr_blocks["private_subnet2_cidr"]
    Availabillity_Zone1 = var.Availabillity_Zones[0]
    Availabillity_Zone2 = var.Availabillity_Zones[1]
}
module "Private_EC2_Module" {
    source = "./sandy_modules/Private_EC2_Module"
    Private_Subnet1_id = module.Private_Network.Sandy_Subnet1_Id
    Private_Subnet2_id = module.Private_Network.Sandy_Subnet2_Id
    Private_Security_Group_id = module.Private_Network.security_Group_Id
}
module "Private_ELB_Module" {
    source = "./sandy_modules/Private_ELB_Module"
    Private_Security_Group_id = module.Private_Network.security_Group_Id
    Private_Subnet1_id = module.Private_Network.Sandy_Subnet1_Id
    Private_Subnet2_id = module.Private_Network.Sandy_Subnet2_Id
    vpc_id = aws_vpc.my-vpc.id
    Ec2_1_id = module.Private_EC2_Module.EC2_1_id
    Ec2_2_id = module.Private_EC2_Module.EC2_2_id
}
module "Public_EC2_Module" {
    source = "./osama_modules/Public_EC2_Module"
    Public_Subnet1_id = module.Public_Network.Public_Subnet1_id
    Public_Subnet2_id = module.Public_Network.Public_Subnet2_id
    Public_Security_Group_id = module.Public_Network.Public_Security_Group_id
    private_elb_dns_name = module.Private_ELB_Module.private_elb_dns_name
}
module "Public_ELB_Module" {
    source = "./osama_modules/Public_ELB_Module"
    Public_Security_Group_id = module.Public_Network.Public_Security_Group_id
    Public_Subnet1_id = module.Public_Network.Public_Subnet1_id
    Public_Subnet2_id = module.Public_Network.Public_Subnet2_id
    vpc_id = aws_vpc.my-vpc.id
    EC2_Nginx1_id = module.Public_EC2_Module.EC2_Nginx1_id
    EC2_Nginx2_id = module.Public_EC2_Module.EC2_Nginx2_id
  
}

output "elb_dns_name" {
  value = module.Public_ELB_Module.alb_dns_name
  
}