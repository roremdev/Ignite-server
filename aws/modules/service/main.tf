locals {
  project = "ignite"
  port    = 80
}

resource "aws_ecs_cluster" "server" {
  name = local.project
}

resource "aws_ecs_task_definition" "server" {
  family                   = local.project
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.security.arn

  container_definitions = jsonencode([
    {
      name         = local.project
      image        = var.repository.url
      cpu          = 256 # .25 vCPU
      memory       = 512 # .5 GB
      essential    = true
      portMappings = [
        {
          containerPort = local.port
          hostPort      = local.port
        }
      ]
      environment = [
        for key, secret in var.secrets : {
          name  = key
          value = secret
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "development" {
  name                 = "development"
  cluster              = aws_ecs_cluster.server.id
  task_definition      = aws_ecs_task_definition.server.arn
  launch_type          = "FARGATE"
  desired_count        = 3
  force_new_deployment = true

  network_configuration {
    assign_public_ip = true
    subnets          = var.network.subnets
    security_groups  = [var.network.security_group]
  }

  load_balancer {
    target_group_arn = var.network.target_group
    container_name   = aws_ecs_task_definition.server.family
    container_port   = local.port
  }
}
