region                                    = "eu-west-2"
zone-one                                  = "eu-west-2a"
zone-two                                  = "eu-west-2c"
vpc-1-cidr                                = "10.0.0.0/16"
subnet-cidr-public                        = "10.0.0.0/24"
subnet-cidr-private-1                     = "10.0.1.0/24"
subnet-cidr-private-2                     = "10.0.2.0/24"
az-1                                      = "eu-west-2a"
az-2                                      = "eu-west-2b"
net-cidr                                  = "0.0.0.0/0"
tenancy                                   = "default"
ingress-port-ssh                          = 22
protocol                                  = "tcp"
target_group_nginx_port                   = 80
target_group_nginx_protocol               = "HTTP"
target_group_nginx_type                   = "ip"
target_group_nginx_protocol-version       = "HTTP1"
laod_balancer_nginx_type                  = "application"
ingress-port-http                         = 80
load_balancer_nginx_listener_port         = 80
load_balancer_nginx_listener_protocol     = "HTTP"
load_balancer_nginx_listener_default_type = "forward"
task_nginx_cpu                            = 512
task-nginx-memory                         = 2048
task_nginx_container_nginx_image          = "nginx:latest"
task_nginx_container_nginx_memory         = 2048
task_nginx_container_nginx_conatinerport  = 80
task_nginx_container_nginx_hostport       = 0
service_nginx_launch_type                 = "FARGATE"
servie_nginx_desired_count                = 2
