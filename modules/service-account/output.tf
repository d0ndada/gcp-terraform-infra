output "name" {
  description = "The name of the service account."
  value       = google_service_account.service_account.name
}

output "email" {
  description = "The email of the service account."
  value       = google_service_account.service_account.email 
}