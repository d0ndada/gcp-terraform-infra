resource "google_artifact_registry_repository" "artifact-repository" {
  name     = var.repository_name
  location = var.location
  repository_id = var.repository_id
  format   = var.format

  description = var.description

  labels = var.labels  
}