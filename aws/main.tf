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

module "security" {
  source = "./modules/security"
}

module "network" {
  source = "./modules/network"
}

module "service" {
  source     = "./modules/service"
  secrets    = data.doppler_secrets.server.map
  repository = module.repository.server
  security   = module.security.server
  network    = module.network.server
}
