terraform {
  required_version = "1.3.6"

#  cloud {
#    organization = "fronity"
#
#    workspaces {
#      tags = ["ignite", "server"]
#    }
#  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }

    doppler = {
      source  = "DopplerHQ/doppler"
      version = "1.1.6"
    }
  }
}