# ℹ️ Description
# Output of AWS Secrets Manager.

output "doppler" {
  description = "Doppler on AWS Secrets Manager"

  value = {
    name = aws_secretsmanager_secret.doppler.name
    arn = aws_secretsmanager_secret.doppler.arn
  }
}
