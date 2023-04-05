variable "target_group_nginx_name" {
  type = string
}
variable "target_group_nginx_port" {
  type = number
}
variable "target_group_nginx_protocol" {
  type = string
}
variable "target_group_nginx_type" {
  type = string
}
variable "target_group_nginx_vpc-id" {
  type = string
}
variable "target_group_nginx_protocol-version" {
  type = string
}
variable "laod_balancer_nginx_name" {
  type = string
}
variable "laod_balancer_nginx_type" {
  type = string

}
variable "subnet_public_id" {
  type = string
}
variable "subnet_private_id-1" {
  type = string
}
/*variable "subnet_private_id-2" {
  type =string
}*/
variable "vpc-id" {
  type = string
}
variable "ingress-port-http" {
  type = number
}
variable "net-cidr" {
  type = string
}
variable "security_group_load_balancer_nginx_name" {
  type = string
}
variable "load_balancer_nginx_listener_port" {
  type = number
}
variable "load_balancer_nginx_listener_protocol" {
  type = string
}
variable "load_balancer_nginx_listener_default_type" {
  type = string
}
