# ℹ️ Description
# Global variables of this project.

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "project" {
  description = "AWS project name"
  default     = "server-ignite"
}

variable "tags" {
  description = "AWS tags"

  default = {
    "project"     = "ignite"
    "environment" = "development"
    "scope"       = "backend"
  }
}