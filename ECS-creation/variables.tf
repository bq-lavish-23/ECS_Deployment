


variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "vpc-1-cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnet-cidr-public" {
  type    = string
  default = "10.0.0.0/24"
}
variable "subnet-cidr-private-1" {
  type    = string
  default = "10.0.1.0/24"
}
variable "subnet-cidr-private-2" {
  type    = string
  default = "10.0.2.0/24"
}
variable "zone-one" {
  type    = string
  default = "ap-south-1b"
}
variable "zone-two" {
  type    = string
  default = "ap-south-1c"
}
variable "az-1" {
  type    = string
  default = "ap-south-1a"
}
variable "az-2" {
  type    = string
  default = "ap-south-1b"
}
variable "net-cidr" {
  type    = string
  default = "0.0.0.0/0"
}
variable "tenancy" {
  type    = string
  default = "default"
}
variable "ingress-port-ssh" {
  type    = number
  default = 22
}
variable "protocol" {
  type    = string
  default = "tcp"
}
variable "target_group_nginx_port" {
  type    = number
  default = 80
}
variable "target_group_nginx_protocol" {
  type    = string
  default = "HTTP"
}
variable "target_group_nginx_type" {
  type    = string
  default = "ip"
}
variable "target_group_nginx_protocol-version" {
  type    = string
  default = "HTTP1"
}
variable "laod_balancer_nginx_type" {
  type    = string
  default = "application"
}
variable "ingress-port-http" {
  type    = number
  default = 80
}
variable "load_balancer_nginx_listener_port" {
  type    = number
  default = 80
}
variable "load_balancer_nginx_listener_protocol" {
  type    = string
  default = "HTTP"
}
variable "load_balancer_nginx_listener_default_type" {
  type    = string
  default = "forward"
}
variable "task_nginx_requires_compatibilities_FARGATE" {
  type    = string
  default = "FARGATE"
}
variable "task_nginx_network_mode" {
  type    = string
  default = "awsvpc"
}
variable "task_nginx_cpu" {
  type    = number
  default = 512
}
variable "task-nginx-memory" {
  type    = number
  default = 2048
}
variable "task_nginx_container_nginx_image" {
  type    = string
  default = "nginx:latest"
}
variable "task_nginx_container_nginx_memory" {
  type    = number
  default = 2048
}
variable "task_nginx_container_nginx_conatinerport" {
  type    = number
  default = 80
}
variable "task_nginx_container_nginx_hostport" {
  type    = number
  default = 0
}
variable "service_nginx_launch_type" {
  type    = string
  default = "FARGATE"
}
variable "service_nginx_desired_count" {
  type    = number
  default = 2
}
variable "security_group_service_from_port" {
  type    = number
  default = 0
}
variable "security_group_service_to_port" {
  type    = number
  default = 65535
}
variable "service_security-group_protocol" {
  type    = string
  default = "tcp"
}
