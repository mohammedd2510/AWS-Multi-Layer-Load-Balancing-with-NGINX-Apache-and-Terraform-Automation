variable "Public_Security_Group_id" {
    type = string
}
variable "Public_Subnet1_id" {
    type = string
}
variable "Public_Subnet2_id" {
    type = string
}
variable "vpc_id" {
    type = string
}
variable "EC2_Nginx1_id" {
  type = string
}
variable "EC2_Nginx2_id" {
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