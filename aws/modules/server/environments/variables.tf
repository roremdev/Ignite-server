# Description
# Defines the input variables that will be referenced for each server environment.

variable "secrets" {
  description = "Secrets for each server environment"
  type        = object({
    DOMAIN     = string
    MODE       = string
    PORT       = string
    PROJECT    = string
    SERVER_URL = string
  })
}

variable "network" {
  description = "Network requirements for each server environment"
  type        = object({
    subnet_ids         = list(string)
    security_groups_id = list(string)
    target_group_arn   = string
  })
}

variable "settings" {
  description = "Server settings"
  type        = object({
    environment        = string
    cluster_id         = string
    repository_url     = string
    execution_role_arn = string
  })
}
