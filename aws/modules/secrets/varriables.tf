# Description
# Defines the input variables that will be referenced for the secrets module.

variable "service_tokens" {
  description = "Doppler Service Tokens for the project environments"
  type        = object({
    development = string
  })
}