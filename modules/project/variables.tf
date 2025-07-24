variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "project_id" {
  description = "The ID of the project."
  type        = string

}

variable "location" {
  description = "The location for the project resources."
  type        = string
  default     = "us-central1"
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

variable "deletion_policy" {
  description = "The deletion policy for the project."
  type        = string
  default     = "DELETE"  # Options: DELETE, ABANDON
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the project."
  type        = map(string)
  default     = {}
}
