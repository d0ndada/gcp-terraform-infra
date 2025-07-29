resource "google_secret_manager_secret" "secret" {
  project   = var.project_id
  labels    = var.labels
  for_each  = { for secret in var.secrets : secret.secret_id => secret }
  secret_id = each.value.secret_id
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "fear_greed_daily_url_version" {
  for_each    = { for secret in var.secrets : secret.secret_id => secret }
  secret      = google_secret_manager_secret.secret[each.key].id
  secret_data = each.value.secret_data
}
