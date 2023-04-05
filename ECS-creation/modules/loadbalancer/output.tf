output "target_group_nginx_arn" {
  value = aws_lb_target_group.target_group_nginx.arn
}
output "security_group_load_balancer_nginx" {
  value = aws_security_group.security_group_load_balancer_nginx.id
}
output "load_balancer_dns" {
  value = aws_lb.load_balancer_nginx.dns_name
}
