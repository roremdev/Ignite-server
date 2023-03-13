resource "aws_vpc" "project" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "vpc-development"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.project.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "sbn-development-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.project.id
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "sbn-development-private"
  }
}

# ----
resource "aws_security_group" "server" {
  name        = "scg-development"
  description = "Allow HTTP and HTTPS inbound traffic to server"
  vpc_id      = aws_vpc.project.id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ----

resource "aws_ecr_repository" "server" {
  name         = "ignite"
  force_delete = true
}

#resource "aws_apprunner_vpc_connector" "sever" {
#  vpc_connector_name = "vpc-connector-server"
#  subnets            = [aws_subnet.public.id]
#  security_groups    = [aws_security_group.server.id]
#}

#resource "aws_apprunner_service" "server" {
#  service_name = "development"
#
#  source_configuration {
#    image_repository {
#      image_configuration {
#        port = "8000"
#      }
#      image_identifier      = "${aws_ecr_repository.server.repository_url}:latest"
#      image_repository_type = "ECR_PUBLIC"
#    }
#    auto_deployments_enabled = false
#  }
#
#  network_configuration {
#    egress_configuration {
#      egress_type       = "VPC"
#      vpc_connector_arn = aws_apprunner_vpc_connector.sever.arn
#    }
#  }
#}