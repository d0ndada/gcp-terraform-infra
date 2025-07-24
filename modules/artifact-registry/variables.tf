variable "location" {
  description = "The location for the Artifact Registry repository."
  type        = string
  default     = "us-central1"
}

variable "repository_id" {
  description = "The ID of the Artifact Registry repository."
  type        = string
}

variable "description" {
  description = "A description of the Artifact Registry repository."
  type        = string
  default     = ""
}

variable "format" {
  description = "The format of the Artifact Registry repository (e.g., 'docker', 'maven')."
  type        = string  
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the Artifact Registry repository."
  type        = map(string)
  default     = {}
}

variable "repository_name" {
  description = "The name of the Artifact Registry repository."
  type        = string
}