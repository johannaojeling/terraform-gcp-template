resource "google_service_account" "service_account" {
  account_id   = "${var.account_id}-${terraform.workspace}"
  display_name = var.display_name
}

resource "google_project_iam_member" "iam_member" {
  for_each = toset(var.roles)

  project = var.project
  role    = "roles/${each.value}"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
