module "project" {
  source = "../project"

  project_name    = var.project_name
  project_id      = var.project_name
  billing_account = var.billing_account
  location        = var.location

  labels = var.labels
}

module "terraform-service-account" {
  source = "../service-account"

  service_accounts = [
    {
      account_id   = var.account_id
      display_name = var.display_name
      description  = var.description
      project_id   = module.project.id
    },
  ]

  depends_on = [module.project]
}

module "terraform-service-account-role" {
  source = "../service-account-role"

  project_id = module.project.id
  service_accounts = [
    {
      email = module.terraform-service-account.emails[var.account_id]
      roles = var.roles
    }
  ]

  depends_on = [module.terraform-service-account]
}

resource "google_service_account_key" "sa_key" {
  service_account_id = module.terraform-service-account.names[var.account_id]
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"

  depends_on = [module.terraform-service-account-role]
}

resource "local_sensitive_file" "sa_key_file" {
  content         = base64decode(google_service_account_key.sa_key.private_key)
  filename        = "${path.root}/terraform-sa.json"
  file_permission = "0600"

  depends_on = [google_service_account_key.sa_key]
}

resource "google_project_service" "serviceusage_api" {
  project = module.project.id
  service = "serviceusage.googleapis.com"

  depends_on = [module.project]
}

resource "google_project_service" "cloudresourcemanager_api" {
  project            = module.project.id
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false

  depends_on = [google_project_service.serviceusage_api]
}

resource "google_project_service" "artifact_registry_api" {
  project            = module.project.id
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = false

  depends_on = [google_project_service.cloudresourcemanager_api]
}

resource "google_project_service" "secret_manager_api" {
  project            = module.project.id
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false

  depends_on = [google_project_service.artifact_registry_api]
}

resource "google_project_service" "cloud_build_api" {
  project            = module.project.id
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false

  depends_on = [google_project_service.secret_manager_api]
}