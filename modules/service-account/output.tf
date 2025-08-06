output "emails" {
  description = "Email addresses of the created service accounts"
  value       = {
    for k, sa in google_service_account.service_account :
    k => sa.email
  }
}

output "names" {
  description = "Names of the created service accounts"
  value       = {
    for k, sa in google_service_account.service_account :
    k => sa.name
  }
}
