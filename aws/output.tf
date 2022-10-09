# ℹ️ Description
# Defines the input variables that are referenced in main.tf.tf, which make the configuration customizable.

output "ecr_repository" {
  description = "Elastic Container Registry"
  value       = module.ecs.repository
}

output "ecs_task" {
  description = "Elastic Container Service"
  value       = module.ecs.task
}

output "secrets_arn" {
  value = module.secrets.arn
}
