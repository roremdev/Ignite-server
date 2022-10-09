# ℹ️ Description
# Output of AWS ECR and ECS.

output "repository" {
  description = "AWS ECR"
  value       = {
    url = aws_ecr_repository.docker.repository_url
    arn = aws_ecr_repository.docker.arn
  }
}

output "cluster" {
  description = "AWS ECS Cluster"
  value       = {
    name = aws_ecs_cluster.server.name
    arn  = aws_ecs_cluster.server.arn
  }
}

output "task" {
  description = "AWS ECS Task"
  value       = {
    arn = aws_ecs_task_definition.server.arn
  }
}