terraform {
  required_version = ">= 1.2.1"
  experiments      = [module_variable_optional_attrs]

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.22.0"
    }
  }

  backend "gcs" {
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

module "api" {
  source   = "./modules/api"
  for_each = toset(var.apis)

  service = each.key
}
