variable "secrets" {
  description = "List of secrets to create in Secret Manager"
  type = list(object({
    secret_id   = string
    secret_data = string
  }))
}

variable "project_id" {
  description = "The ID of the project in which the resources will be created"
  type        = string  
  
}

variable "labels" {
  description = "Labels to apply to the secret"
  type        = map(string)
  default     = {}
}
