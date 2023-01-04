output "server" {
  description = "AWS ECR"
  value       = {
    url = aws_ecr_repository.server.repository_url
    arn = aws_ecr_repository.server.arn
  }
}
