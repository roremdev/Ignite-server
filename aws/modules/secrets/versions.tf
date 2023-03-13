# Description
# Defines version constraints for Doppler provider.

terraform {
  required_version = "1.3.7"
  required_providers {
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.1.6"
    }
  }
}