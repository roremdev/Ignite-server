resource "aws_ecr_repository" "server" {
  name         = "ignite"
  force_delete = true
}