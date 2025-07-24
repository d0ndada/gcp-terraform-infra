variable "account_id" {
  description = "The ID of the service account."
  type        = string  
}

variable "display_name" {
  description = "The display name of the service account."
  type        = string
  default     = ""
}

variable "description" {
  description = "A description of the service account."
  type        = string
  default     = ""
}

variable "project_id" {
  description = "The ID of the project where the service account will be created."
  type        = string
}   