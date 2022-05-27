variable "project" {
  type        = string
  description = "Default project"
}

variable "region" {
  type        = string
  description = "Default region"
  default     = "europe-west1"
}

variable "apis" {
  type        = list(string)
  description = "APIs to enable"
  default     = []
}

variable "app_engine" {
  type = object({
    location = string
  })
  description = "App Engine configuration"
}

variable "service_accounts" {
  type = map(object({
    display_name = string
    roles        = optional(list(string))
  }))
  description = "Service accounts to create"
  default     = {}
}
