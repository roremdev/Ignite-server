# ℹ️ Description
# Defines the input variables that are referenced in main.tf.tf, which make the configuration customizable.

variable "project" {
  description = "AWS project name"
}

variable "ecs_role_arn" {
  description = "The ECS role to use for the ECS cluster"
}

variable "subnet" {
  description = "The subnet to use for the ECS cluster"
}

variable "security_group" {
  description = "The security group to use for the ECS cluster"
}

variable "secrets_arn" {
  description = "The ARN of the secrets manager secret to use for the ECS cluster"
}