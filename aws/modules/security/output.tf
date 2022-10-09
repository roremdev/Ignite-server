# ℹ️ Description
# Output of AWS IAM.

output "server" {
  description = "Server on AWS IAM"
  value       = {
    name     = aws_iam_role.server.name
    arn      = aws_iam_role.server.arn
    policies = [
      aws_iam_role_policy_attachment.server_secretsmanager.policy_arn,
      aws_iam_role_policy_attachment.server_ecs.policy_arn
    ]
  }
}