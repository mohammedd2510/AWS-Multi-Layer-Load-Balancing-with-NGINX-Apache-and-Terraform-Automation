variable "Private_Subnet1_id" {
    type = string
  
}
variable "Private_Subnet2_id" {
    type = string
}
variable "Private_Security_Group_id" {
    type = string
}
variable "Ec2_Instance_Type" {
    type = string
    default = "t2.micro"
}