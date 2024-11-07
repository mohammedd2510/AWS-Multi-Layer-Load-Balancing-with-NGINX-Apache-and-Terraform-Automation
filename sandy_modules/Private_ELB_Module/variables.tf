variable "vpc_id" {
    type = string
}
variable "Private_Subnet1_id" {
    type = string
  
}
variable "Private_Subnet2_id" {
    type = string
}
variable "Private_Security_Group_id" {
    type = string
}
variable "Ec2_1_id" {
    type = string
}
variable "Ec2_2_id" {
    type = string
}
variable "load_balancer_type" {
    type = string
    default = "application"
}
variable "elb_listener_protocol" {
  type = string
  default = "HTTP"
}
variable "elb_listener_port" {
  type = number
  default = 80
}