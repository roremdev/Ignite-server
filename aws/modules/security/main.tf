# ℹ️ Description
# Specifies the AWS IAM provider for security.

# 📚 AWS Secrets Manager
# Generates an IAM policy document in JSON format.
# ✍️ Arguments:
# - statement: Configuration block for a policy statement.
#   - actions: List of actions to allow.
#   - effect(allow): Whether this statement allows or denies the given actions.
#   - principals: Define to whom a statement applies.
#     - type: The type of principal.
#     - identifiers: The identifiers of the principal.
data "aws_iam_policy_document" "server" {

  # Allow temporary access to:
  # - ECS Tasks.
  # - Secrets Manager
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com",
        "secretsmanager.amazonaws.com"
      ]
    }
  }
}

# 📚 AWS IAM Role
# Provides an IAM role.
# ✍️ Arguments:
# - name: Friendly name of the role.
# - description: Description of the role.
# - assume_role_policy: Policy that grants an entity permission to assume the role.
resource "aws_iam_role" "server" {
  name               = "ecs-${var.project}"
  description        = "Ignite Server role for ECS tasks and Secrets Manager"
  assume_role_policy = data.aws_iam_policy_document.server.json
}

# 📚 AWS IAM Role Policy
# Attaches a Managed IAM Policy to an IAM role.
# ✍️ Arguments:
# - role: The name of the IAM role to which the policy should be applied.
# - policy_arn: The ARN of the IAM policy you want to apply.
resource "aws_iam_role_policy_attachment" "server_ecs" {
  role       = aws_iam_role.server.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
resource "aws_iam_role_policy_attachment" "server_secretsmanager" {
  role       = aws_iam_role.server.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}