resource "aws_lb_target_group" "target_group_nginx" {
  name             = var.target_group_nginx_name
  port             = var.target_group_nginx_port
  protocol         = var.target_group_nginx_protocol
  target_type      = var.target_group_nginx_type
  vpc_id           = var.target_group_nginx_vpc-id
  protocol_version = var.target_group_nginx_protocol-version
}

resource "aws_lb" "load_balancer_nginx" {
  name               = var.laod_balancer_nginx_name
  internal           = false
  load_balancer_type = var.laod_balancer_nginx_type
  security_groups    = [aws_security_group.security_group_load_balancer_nginx.id]
  // subnets            = [var.subnet_private_id-1,var.subnet_private_id-2]
  subnets = [var.subnet_public_id, var.subnet_private_id-1]
}

resource "aws_lb_listener" "load_balancer_nginx_listener" {
  load_balancer_arn = aws_lb.load_balancer_nginx.arn
  port              = var.load_balancer_nginx_listener_port
  protocol          = var.load_balancer_nginx_listener_protocol


  default_action {
    type             = var.load_balancer_nginx_listener_default_type
    target_group_arn = aws_lb_target_group.target_group_nginx.arn
  }
}

resource "aws_security_group" "security_group_load_balancer_nginx" {
  description = "Allow http inbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description = "http from net"
    from_port   = var.ingress-port-http
    to_port     = var.ingress-port-http
    protocol    = "tcp"
    cidr_blocks = [var.net-cidr]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.net-cidr]

  }

  tags = {
    Name = var.security_group_load_balancer_nginx_name
  }
}
