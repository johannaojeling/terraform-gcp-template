variable "name" {
  type        = string
  description = "Bucket name"
}

variable "location" {
  type        = string
  description = "Bucket location"
}

variable "storage_class" {
  type        = string
  description = "Bucket storage class"
}

variable "force_destroy" {
  type        = bool
  description = "Whether to delete all contained objects when deleting a bucket"
}
