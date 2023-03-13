provider "aws" {
  region  = "us-east-1"
  profile = "user"

  default_tags {
    tags = {
      Project      = "Ignite"
      Organization = "Fronity"
    }
  }
}