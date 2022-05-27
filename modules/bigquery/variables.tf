variable "dataset" {
  type        = string
  description = "Dataset name"
}

variable "location" {
  type        = string
  description = "Dataset location"
}

variable "delete_contents_on_destroy" {
  type        = bool
  description = "Whether to allow deletion of the dataset when there are tables present"
}

variable "tables" {
  type = map(object({
    schema = string
    time_partitioning = optional(object({
      expiration_ms = optional(number)
      field         = optional(string)
      type          = string
    }))
    deletion_protection = optional(bool)
  }))
  description = "Table configuration"
}
