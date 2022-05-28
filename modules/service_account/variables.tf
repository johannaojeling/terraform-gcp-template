variable "project" {
  type        = string
  description = "Project"
}

variable "account_id" {
  type        = string
  description = "Service account id"
}

variable "display_name" {
  type        = string
  description = "Service account display name"
}

variable "roles" {
  type        = set(string)
  description = "Roles to grant service account"
}
