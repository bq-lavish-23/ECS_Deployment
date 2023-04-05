
module "vpc-1" {
  source                = "./modules/vpc/"
  vpc-cidr              = var.vpc-1-cidr
  subnet-public-cidr    = var.subnet-cidr-public
  subnet-private-cidr-1 = var.subnet-cidr-private-1
  subnet-private-cidr-2 = var.subnet-cidr-private-2
  vpc-name              = "vpc-owner-1"
  subnet-public-name    = "subnet-1-public"
  subnet-private-name-1 = "subnet-1-private"
  subnet-private-name-2 = "subnet-2-private"
  igw-name              = "igw-1"
  rt-private-subnet     = "rt-1-private"
  rt-public-subnet      = "rt-1-public"
  az-1                  = var.az-1
  az-2                  = var.az-2
  net-cidr              = var.net-cidr
  tenancy               = var.tenancy
  /*providers = {
    aws = aws.us-1
   }*/
}

module "load_balancer_nginx" {
  source                              = "./modules/loadbalancer"
  target_group_nginx_name             = "target-group-nginx-name"
  target_group_nginx_port             = var.target_group_nginx_port
  target_group_nginx_protocol         = var.target_group_nginx_protocol
  target_group_nginx_type             = var.target_group_nginx_type
  target_group_nginx_vpc-id           = module.vpc-1.vpc-id
  target_group_nginx_protocol-version = var.target_group_nginx_protocol-version
  laod_balancer_nginx_name            = "load-balancer-nginx"
  laod_balancer_nginx_type            = var.laod_balancer_nginx_type
  subnet_public_id                    = module.vpc-1.subnet-id-public
  subnet_private_id-1                 = module.vpc-1.subnet-id-private-1
  //subnet_private_id-2=module.vpc-1.subnet-id-private-2
  security_group_load_balancer_nginx_name   = "security_group_load_balancer_nginx_name"
  vpc-id                                    = module.vpc-1.vpc-id
  ingress-port-http                         = var.ingress-port-http
  net-cidr                                  = var.net-cidr
  load_balancer_nginx_listener_port         = var.load_balancer_nginx_listener_port
  load_balancer_nginx_listener_protocol     = var.load_balancer_nginx_listener_protocol
  load_balancer_nginx_listener_default_type = var.load_balancer_nginx_listener_default_type
}

module "ecs" {
  source                                      = "./modules/ecs"
  cluster_nginx_name                          = "cluster_nginx"
  task_nginx_name                             = "task_nginx"
  task_nginx_requires_compatibilities_FARGATE = var.task_nginx_requires_compatibilities_FARGATE
  task_nginx_network_mode                     = var.task_nginx_network_mode
  task_nginx_cpu                              = var.task_nginx_cpu
  task-nginx-memory                           = var.task-nginx-memory
  task_nginx_container_nginx_name             = "container_nginx"
  task_nginx_container_nginx_image            = var.task_nginx_container_nginx_image
  task_nginx_container_nginx_memory           = var.task_nginx_container_nginx_memory
  task_nginx_container_nginx_conatinerport    = var.task_nginx_container_nginx_conatinerport
  //task_nginx_container_nginx_hostport=var.task_nginx_container_nginx_hostport
  service_nginx_name                           = "service_nginx"
  service_nginx_launch_type                    = var.service_nginx_launch_type
  servie_nginx_desired_count                   = var.service_nginx_desired_count
  subnet-private-1                             = module.vpc-1.subnet-id-private-1
  subnet-private-2                             = module.vpc-1.subnet-id-private-2
  service_nginx_target_group_arn               = module.load_balancer_nginx.target_group_nginx_arn
  security_group_service_nginx_loadbalancer_sg = module.load_balancer_nginx.security_group_load_balancer_nginx
  security_group_service_from_port             = var.security_group_service_from_port
  security_group_service_to_port               = var.security_group_service_to_port
  service_security-group_protocol              = var.service_security-group_protocol
  vpc-id                                       = module.vpc-1.vpc-id
}


output "lb_dns" {
  value= module.load_balancer_nginx.load_balancer_dns
}