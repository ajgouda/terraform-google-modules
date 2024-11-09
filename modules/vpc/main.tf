resource "google_compute_network" "network" {
  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  internal_ipv6_range     = var.internal_ipv6_range
  project                 = var.project_id
}