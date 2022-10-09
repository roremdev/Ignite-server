# ℹ️ Description
# Input variables for AWS ECS

variable "project" {
  description = "AWS project name"
}

variable "security" {
  description = "AWS IAM"
}

variable "network" {
  description = "AWS network"
}

variable "secrets" {
  description = "AWS Secrets Manager"
}
