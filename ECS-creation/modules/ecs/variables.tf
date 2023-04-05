variable "cluster_nginx_name" {
  type = string
}
variable "task_nginx_name" {
  type = string
}
variable "task_nginx_requires_compatibilities_FARGATE" {
  type = string
}
variable "task_nginx_network_mode" {
  type = string
}
variable "task_nginx_cpu" {
  type = number
}
variable "task-nginx-memory" {
  type = number
}
variable "task_nginx_container_nginx_name" {
  type = string
}
variable "task_nginx_container_nginx_image" {
  type = string
}
variable "task_nginx_container_nginx_memory" {
  type = number
}
variable "task_nginx_container_nginx_conatinerport" {
  type = number
}
/*variable "task_nginx_container_nginx_hostport" {
  type=number
}*/
variable "service_nginx_name" {
  type = string
}
variable "service_nginx_launch_type" {
  type = string
}
variable "servie_nginx_desired_count" {
  type = number
}

variable "subnet-private-1" {
  type = string
}
variable "subnet-private-2" {
  type = string
}
variable "service_nginx_target_group_arn" {
  type = string
}
variable "security_group_service_nginx_loadbalancer_sg" {
  type = string
}
variable "vpc-id" {
  type = string
}
variable "security_group_service_from_port" {
  type = number
}
variable "security_group_service_to_port" {
  type = number
}
variable "service_security-group_protocol" {
  type = string
}
