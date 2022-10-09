# ℹ️ Description
# Global output of this project.

output "secrets" {
  description = "Doppler on AWS Secrets Manager"
  value       = module.secrets.doppler
}

output "security" {
  description = "AWS IAM"
  value       = module.security.server
}

output "network" {
  description = "AWS network"
  value       = module.network.server
}

output "repository" {
  description = "AWS ECR"
  value       = module.ecs.repository
}

output "cluster" {
  description = "AWS ECS Cluster"
  value       = module.ecs.cluster
}

output "task" {
  description = "AWS ECS Task"
  value       = module.ecs.task
}