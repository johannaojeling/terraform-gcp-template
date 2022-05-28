resource "google_compute_subnetwork" "subnet" {
  for_each = var.subnets

  name          = "${each.key}-${terraform.workspace}"
  network       = google_compute_network.vpc_network.id
  region        = each.value.region
  ip_cidr_range = each.value.ip_cidr_range
}
