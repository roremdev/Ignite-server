resource "aws_secretsmanager_secret" "doppler" {
  name                    = "development/doppler"
  recovery_window_in_days = 0
}
