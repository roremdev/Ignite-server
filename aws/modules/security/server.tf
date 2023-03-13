# Description
# AWS project network for backend.
# By default, the project need execution permissions for launch tasks.
# The resource in default network are:
# - IAM role
# - IAM Policy

data "aws_iam_policy_document" "server" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "server" {
  name               = "AWSTaskDefinitionForECS"
  description        = "Role to have execution role ARN for AWS ECR and ECS."
  assume_role_policy = data.aws_iam_policy_document.server.json
  tags               = {
    resource = "server"
  }
}

resource "aws_iam_role_policy_attachment" "server" {
  role       = aws_iam_role.server.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}