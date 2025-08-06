variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}


variable "service_accounts" {
  description = "The service account object containing account_id, display_name, description, and project_id."
  type = list(object({
    email = string
    roles = list(string)
  }))
}