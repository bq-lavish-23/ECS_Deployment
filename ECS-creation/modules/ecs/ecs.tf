resource "aws_ecs_cluster" "cluster_nginx" {
  name = var.cluster_nginx_name
}

resource "aws_ecs_task_definition" "task_nginx" {
  family                   = var.task_nginx_name
  requires_compatibilities = [var.task_nginx_requires_compatibilities_FARGATE]
  network_mode             = var.task_nginx_network_mode
  cpu                      = var.task_nginx_cpu
  memory                   = var.task-nginx-memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name   = var.task_nginx_container_nginx_name
      image  = var.task_nginx_container_nginx_image
      memory = var.task_nginx_container_nginx_memory
      portMappings = [
        {
          containerPort = var.task_nginx_container_nginx_conatinerport
         // hostPort      =    var.task_nginx_container_nginx_conatinerport   #var.task_nginx_container_nginx_hostport
        }
      ]
    }
  ])
}

data "aws_iam_policy_document" "ecs_task_execution_role" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "ecs_task_execution_role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role.json
}
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_service" "service_nginx" {
  name            = var.service_nginx_name
  launch_type     = var.service_nginx_launch_type
  cluster         = aws_ecs_cluster.cluster_nginx.id
  task_definition = aws_ecs_task_definition.task_nginx.arn
  desired_count   = var.servie_nginx_desired_count


  network_configuration {
    subnets          = [var.subnet-private-1, var.subnet-private-2]
    assign_public_ip = true
    security_groups = [
      aws_security_group.service_nginx_security_group.id
    ] // set it after wards if code stops the traffic                                //imp
  }

  load_balancer {
  #  elb_name = "load-balancer-nginx"
    target_group_arn = var.service_nginx_target_group_arn
    container_name   = var.task_nginx_container_nginx_name
    container_port   = var.task_nginx_container_nginx_conatinerport
  }
  depends_on = [ aws_iam_role_policy_attachment.ecs_task_execution_role]
}

resource "aws_security_group" "service_nginx_security_group" {
  vpc_id = var.vpc-id
  ingress {
    description     = "tcp from security group[]"
    from_port       = var.security_group_service_from_port
    to_port         = var.security_group_service_to_port
    protocol        = "tcp"
    security_groups = [var.security_group_service_nginx_loadbalancer_sg]
    #cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
   # security_groups = [var.security_group_service_nginx_loadbalancer_sg]
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "service_nginx_security_group"
  }
}

