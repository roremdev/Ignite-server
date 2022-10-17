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

variable "doppler_token" {
  description = "A token to authenticate with Doppler"
  type        = string
}

variable "settings" {
  description = "Settings for the project"
  default     = {
    port          = 80
    "environment" = "development"
  }
}

variable "tags" {
  description = "AWS tags"

  default = {
    "project"     = "ignite"
    "environment" = "development"
    "scope"       = "backend"
  }
}