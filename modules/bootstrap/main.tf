module "terraform-service-account" {
  source = "../service-account"

  account_id   = var.account_id
  display_name = var.display_name
  description  = var.description
  project_id   = var.project_id
}

module "terraform-service-account-role" {
  source = "../service-account-role"

  project_name = var.project_name
  project_id   = var.project_id
  roles        = var.roles
  service_account_email = module.terraform-service-account.email
}

resource "google_service_account_key" "sa_key" {
  service_account_id = module.terraform-service-account.name
  private_key_type = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

resource "local_sensitive_file" "sa_key_file" {
  content         = base64decode(google_service_account_key.sa_key.private_key)
  filename          = "${path.root}/terraform-sa.json"
  file_permission   = "0600"
}

module "project" {
  source = "../project"

  project_name      = var.project_name
  project_id        = var.project_name
  billing_account   = var.billing_account
  location          = var.location

  labels = var.labels
}
