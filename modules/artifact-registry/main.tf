resource "google_artifact_registry_repository" "artifact-repository" {
  project       = var.project_id
  location      = var.location
  repository_id = var.repository_id
  format        = var.format

  description = var.description

  labels = var.labels
}