# Description
# AWS ECS definitions for Dashboard server.
# The resource in default network are:
# - Task definition
# - ECS service

locals {
  environment        = var.settings.environment
  execution_role_arn = var.settings.execution_role_arn
  repository_url     = var.settings.repository_url
  cluster_name       = var.settings.cluster_id

  subnet_ids          = var.network.subnet_ids
  security_groups_ids = var.network.security_groups_id
  target_group_arn    = var.network.target_group_arn

  port             = 80
  cpu              = 256 # .25 vCPU
  memory           = 512 # .5 GB
  devices_launched = 3
}

resource "aws_ecs_task_definition" "environment" {
  family                   = local.environment
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = local.cpu
  memory                   = local.memory
  execution_role_arn       = local.execution_role_arn
  container_definitions    = jsonencode([
    {
      name         = local.environment
      image        = local.repository_url
      cpu          = local.cpu
      memory       = local.memory
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
  tags = {
    resource = "server"
  }
}

resource "aws_ecs_service" "environment" {
  name                 = local.environment
  cluster              = local.cluster_name
  task_definition      = aws_ecs_task_definition.environment.arn
  launch_type          = "FARGATE"
  desired_count        = local.devices_launched
  force_new_deployment = true
  network_configuration {
    assign_public_ip = true
    subnets          = local.subnet_ids
    security_groups  = local.security_groups_ids
  }
  load_balancer {
    target_group_arn = local.target_group_arn
    container_name   = aws_ecs_task_definition.environment.family
    container_port   = local.port
  }
  tags = {
    resource = "server"
  }
}