# ℹ️ Description
# Output of AWS ECR.

output "docker" {
  description = "AWS ECR"
  value       = {
    url = aws_ecr_repository.docker.repository_url
    arn = aws_ecr_repository.docker.arn
  }
}
