resource "aws_lb" "server" {
  name               = var.project
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  security_groups    = [aws_security_group.server.id]
}

resource "aws_alb_target_group" "server" {
  name        = var.project
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.server.id

  health_check {
    matcher = "200"
    path    = "/"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "server" {
  load_balancer_arn = aws_lb.server.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.server.arn
  }
}