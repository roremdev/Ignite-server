output "server" {
  description = "AWS network"
  value       = {
    subnets = [
      aws_default_subnet.subnet_a.id,
      aws_default_subnet.subnet_b.id,
      aws_default_subnet.subnet_c.id
    ]
    target_group   = aws_alb_target_group.server.arn
    security_group = aws_security_group.environment.id
  }
}