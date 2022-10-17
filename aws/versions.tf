# ℹ️ Description
# Defines version constraints for Terraform and the AWS provider.

# ♻️ Workspaces:
# - server-ignite [backend, ignite]
terraform {
  required_version = ">= 1.1.7"

  cloud {
    organization = "threepoints"

    workspaces {
      tags = ["ignite", "backend"]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.32.0"
    }

    doppler = {
      source = "DopplerHQ/doppler"
    }
  }
}