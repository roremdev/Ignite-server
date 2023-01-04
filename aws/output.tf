# ℹ️ Description
# Global output of this project.

#output "secrets" {
#  description = "Doppler Environment Secrets"
#  value       = nonsensitive(data.doppler_secrets.server.map)
#}

output "repository" {
  description = "AWS ECR"
  value       = module.repository.server
}

#output "cluster" {
#  description = "AWS ECS Cluster"
#  value       = module.ecs.cluster
#}
#
#output "security" {
#  description = "AWS IAM"
#  value       = module.security.server
#}
#
#output "task" {
#  description = "AWS ECS Task"
#  value       = module.ecs.task
#}

output "network" {
  description = "AWS network"
  value       = module.network.server
}
