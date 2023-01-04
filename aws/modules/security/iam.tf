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
  description        = "Role to have execution role ARN to support ECR images."
  assume_role_policy = data.aws_iam_policy_document.server.json
}

resource "aws_iam_role_policy_attachment" "server" {
  role       = aws_iam_role.server.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}