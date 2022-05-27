resource "google_app_engine_application" "app_engine" {
  location_id   = var.location
  database_type = "CLOUD_FIRESTORE"
}
