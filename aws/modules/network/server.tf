locals {
  resource = "server"
}

resource "aws_security_group" "server_lb" {
  name_prefix = "server-lb"
  description = "Security group for server load balancer"
  vpc_id      = aws_vpc.project.id

  ingress {
    description = "Allow communication from anywhere on port 80"
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
}

resource "aws_lb" "server_lb" {
  name               = "server-lb"
  load_balancer_type = "application"
  subnets            = local.subnets_ids
  security_groups    = [aws_security_group.server_lb.id]

  depends_on = [aws_internet_gateway.project]
}

resource "aws_lb_target_group" "server_lb" {
  name        = "server-lb"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.project.id

  health_check {
    matcher = "200"
    path    = "/"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "server_lb" {
  load_balancer_arn = aws_lb.server_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.server_lb.arn
  }
}