# Description
# Defines a resume of the secrets module.

data "doppler_secrets" "development" {
  provider = doppler.dev
}

output "development" {
  value = data.doppler_secrets.development.map
}