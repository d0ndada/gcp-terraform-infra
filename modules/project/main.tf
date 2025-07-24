resource "google_project" "project" {
  name       = var.project_name
  project_id = var.project_id
  org_id     = var.org_id

  billing_account = var.billing_account

  deletion_policy = var.deletion_policy

  labels = var.labels
}


resource "time_sleep" "wait_60_seconds" {
  create_duration = "60s"
  depends_on      = [google_project.project]
}

resource "google_project_service" "apihub_service" {
  project    = google_project.project.project_id
  service    = "apihub.googleapis.com"
  depends_on = [time_sleep.wait_60_seconds]
}

resource "google_apihub_host_project_registration" "apihub_host_registration" {
  project                      = google_project.project.project_id
  location                     = var.location
  host_project_registration_id = google_project.project.project_id
  gcp_project                  = "projects/${google_project.project.project_id}"
  depends_on                   = [google_project_service.apihub_service]
}