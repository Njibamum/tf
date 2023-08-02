output "secret_id" {
  description = "The ID of the created Secrets Manager secret."
  value       = aws_secretsmanager_secret.my_secret.id
}
