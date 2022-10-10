# Load Balancer Security Group
resource "aws_security_group" "server" {
  name        = "server"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.project
  }
}

## Traffic to the ECS cluster should only come from the Load Balancer
resource "aws_security_group" "environment" {
  name        = "environment"
  description = "Allows traffic only from load balancer"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = [aws_security_group.server.id]
  }

  egress {
    from_port   = 0 # Allowing any incoming port
    to_port     = 0 # Allowing any outgoing port
    protocol    = "-1" # Allowing any outgoing protocol
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }

  tags = {
    Name = var.project
  }
}