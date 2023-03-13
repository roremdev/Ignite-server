# Description
# AWS service for the project.
# By default, AWS ECR is used for storing docker images tagged by the environment.

locals {
  project            = "ignite"
  execution_role_arn = var.security.execution_role_arn
}

resource "aws_ecs_cluster" "server" {
  name = local.project
  tags = {
    resource = "server"
  }
}

resource "aws_ecr_repository" "server" {
  name         = local.project
  force_delete = true
  tags         = {
    resource = "server"
  }
}

module "development" {
  source   = "./environments"
  secrets  = var.secrets.development
  network  = var.network
  settings = {
    environment        = "development"
    cluster_id         = aws_ecs_cluster.server.id
    repository_url     = aws_ecr_repository.server.repository_url
    execution_role_arn = local.execution_role_arn
  }
}
