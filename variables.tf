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
  type        = set(string)
  description = "APIs to enable"
  default     = []
}

variable "app_engine" {
  type = object({
    location = string
  })
  description = "App Engine configuration"
}

variable "bigquery_datasets" {
  type = map(object({
    location = optional(string)
    tables = optional(map(object({
      schema = string
      time_partitioning = optional(object({
        expiration_ms = optional(number)
        field         = optional(string)
        type          = string
      }))
      deletion_protection = optional(bool)
    })))
    delete_contents_on_destroy = optional(bool)
  }))
  description = "BigQuery datasets to create"
  default     = {}
}

variable "service_accounts" {
  type = map(object({
    display_name = string
    roles        = optional(set(string))
  }))
  description = "Service accounts to create"
  default     = {}
}

variable "storage_buckets" {
  type = map(object({
    location      = optional(string)
    storage_class = optional(string)
    force_destroy = optional(bool)
  }))
  description = "Storage buckets to create"
  default     = {}
}
