# Description
# Defines doppler environments of the secrets variables for the project.

provider "doppler" {
  doppler_token = var.service_tokens.development
  alias         = "dev"
}