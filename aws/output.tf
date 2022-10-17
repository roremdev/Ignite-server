# ℹ️ Description
# Global output of this project.

output "secrets" {
  description = "Doppler Service"
  value       = nonsensitive(data.doppler_secrets.ignite.map)
}

output "repository" {
  description = "AWS ECR"
  value       = module.repository.docker
}

output "cluster" {
  description = "AWS ECS Cluster"
  value       = module.ecs.cluster
}

output "security" {
  description = "AWS IAM"
  value       = module.security.server
}

output "task" {
  description = "AWS ECS Task"
  value       = module.ecs.task
}

output "network" {
  description = "AWS network"
  value       = module.network.server
}
