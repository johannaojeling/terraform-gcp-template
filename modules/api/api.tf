resource "google_project_service" "service" {
  service            = var.service
  disable_on_destroy = false
}
