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

module "app_engine" {
  source = "./modules/app_engine"

  location = var.app_engine.location
}

module "bigquery" {
  source   = "./modules/bigquery"
  for_each = var.bigquery_datasets

  dataset                    = each.key
  location                   = each.value.location == null ? var.region : each.value.location
  tables                     = each.value.tables == null ? {} : each.value.tables
  delete_contents_on_destroy = false
}

module "service_account" {
  source   = "./modules/service_account"
  for_each = var.service_accounts

  project      = var.project
  account_id   = each.key
  display_name = each.value.display_name
  roles        = each.value.roles == null ? [] : each.value.roles
}
