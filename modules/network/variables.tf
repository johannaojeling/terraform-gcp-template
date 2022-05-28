variable "vpc" {
  type        = string
  description = "VPC name"
}

variable "subnets" {
  type = map(object({
    region                   = string
    ip_cidr_range            = string
    private_ip_google_access = optional(bool)
  }))
  description = "Subnet configuration"
}
