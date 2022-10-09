# ℹ️ Description
# Defines the input variables that are referenced in main.tf.tf, which make the configuration customizable.

output "ecs_role_arn" {
  description = "The ARN of the ECS role created"
  value       = aws_iam_role.ecs_role.arn
}