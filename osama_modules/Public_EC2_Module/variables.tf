variable "Public_Security_Group_id" {
    type = string
}
variable "Public_Subnet1_id" {
    type = string
}
variable "Public_Subnet2_id" {
    type = string
}
variable "Connection_user" {
   type = string
   default = "ubuntu"
}
variable "Private_Key_Path"{
    type = string
    default = "./osama_modules/Public_EC2_Module/Osama.pem"
}
variable "Ec2_Instance_Type" {
    type = string
    default = "t2.micro"
}
variable "private_elb_dns_name" {
    type = string
}