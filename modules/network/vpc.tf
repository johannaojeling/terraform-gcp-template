resource "google_compute_network" "vpc_network" {
  name                    = "${var.vpc}-${terraform.workspace}"
  auto_create_subnetworks = false
}
