# ℹ️ Description
# Specifies the AWS provider, a provider plugin that Terraform will use to manage our AWS resources.
# The configuration defines:
# - VPC settings
# - IAM Policy and Role as ECS resource
# - ECS Cluster

provider "aws" {
  region = var.region

}
module "secrets" {
  source  = "./modules/secrets"
}

module "network" {
  source  = "./modules/network"
  project = var.project
}

module "security" {
  source  = "./modules/security"
  project = var.project
}

module "ecs" {
  source         = "./modules/ecs"
  project        = var.project
  ecs_role_arn   = module.security.ecs_role_arn
  subnet         = module.network.subnet
  security_group = module.network.security_group
  secrets_arn    = module.secrets.arn
}
