resource "google_bigquery_dataset" "dataset" {
  dataset_id = "${var.dataset}_${terraform.workspace}"
  location   = var.location
}
