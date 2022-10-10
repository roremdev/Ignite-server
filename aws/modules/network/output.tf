# ℹ️ Description
# Output of AWS network.

output "server" {
  description = "AWS network"
  value       = {
    subnets = [
      aws_subnet.subnet_a.id, aws_subnet.subnet_b.id
    ]
    target_group   = aws_alb_target_group.server.arn
    security_group = aws_security_group.environment.id
  }
}