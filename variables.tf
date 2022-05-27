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
