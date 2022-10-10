resource "aws_ecr_repository" "docker" {
  name = var.project
}