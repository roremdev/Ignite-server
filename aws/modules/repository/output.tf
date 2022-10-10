# ℹ️ Description
# Output of AWS ECR and ECS.

output "server" {
  description = "AWS ECR"
  value       = {
    url = aws_ecr_repository.docker.repository_url
    arn = aws_ecr_repository.docker.arn
  }
}
