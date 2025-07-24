variable "project_name" {
  description = "The name of the Google Cloud project."
  type        = string
}

variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

variable "roles" {
  description = "A list of roles to assign to the service account."
  type        = list(string)
}

variable "service_account_email" {
  description = "The email of the service account to which the roles will be assigned."
  type        = string
}