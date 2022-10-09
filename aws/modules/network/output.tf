# ℹ️ Description
# Output of AWS network.

output "server" {
  description = "AWS network"
  value       = {
    subnet         = aws_subnet.subnet.id
    security_group = aws_security_group.security_group.id
  }
}