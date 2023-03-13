# Description
# Defines the input variables that will be referenced for the database module.

variable "secrets" {
  description = "Secrets for each server environment"
  type        = map(object({
    DOMAIN     = string
    MODE       = string
    PORT       = string
    PROJECT    = string
    SERVER_URL = string
  }))
}

variable "network" {
  description = "Network requirements for each server environment"
  type        = object({
    subnet_ids         = list(string)
    security_groups_id = list(string)
    target_group_arn   = string
  })
}

variable "security" {
  description = "Settings for each server environment"
  type        = object({
    execution_role_arn = string
  })
}