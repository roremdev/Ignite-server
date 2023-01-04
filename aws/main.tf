provider "aws" {
  region  = "us-east-1"
  profile = "terraform"

  default_tags {
    tags = {
      project      = "ignite"
      organization = "fronity"
      resource     = "server"
    }
  }
}

provider "doppler" {
  doppler_token = var.doppler_token
}

data "doppler_secrets" "server" {}

module "repository" {
  source = "./modules/repository"
}

#module "security" {
#  source  = "./modules/security"
#  project = var.project
#}

module "network" {
  source = "./modules/network"
}

#module "ecs" {
#  source     = "./modules/ecs"
#  project    = var.project
#  secrets    = data.doppler_secrets.ignite.map
#  repository = module.repository.docker
#  security   = module.security.server
#  network    = module.network.server
#}
