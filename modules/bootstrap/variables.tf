variable "project_name" {
  description = "The name of the Google Cloud project."
  type        = string
}

variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

variable "account_id" {
  description = "The ID of the service account."
  type        = string
}

variable "description" {
  description = "A description of the service account."
  type        = string
  default     = ""
}

variable "display_name" {
  description = "The display name of the service account."
  type        = string
  default     = ""
}

variable "roles" {
  description = "A list of roles to assign to the service account."
  type        = list(string)
}

variable "org_id" {
  description = "The organization ID to which the project belongs."
  type        = string
  default     = ""
}

variable "billing_account" {
  description = "The billing account to associate with the project."
  type        = string
}

variable "location" {
  description = "The location for the project resources."
  type        = string
  default     = "us-central1"
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the project."
  type        = map(string)
  default     = {}

}