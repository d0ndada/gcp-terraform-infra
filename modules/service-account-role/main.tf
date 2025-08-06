resource "google_project_iam_member" "bindings" {
  for_each = {
    for sa in flatten([
      for account in var.service_accounts : [
        for role in account.roles : {
          email = account.email
          role  = role
        }
      ]
    ]) : "${sa.email}_${sa.role}" => sa
  }

  project = var.project_id
  role    = each.value.role
  member  = "serviceAccount:${each.value.email}"
}
