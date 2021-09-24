# locals {
#   name = "vpc-peering-to-${var.project_name}"
# }

resource "google_compute_network_peering" "to-transit" {
  name                 = "vpc-peering-${var.peering_name}-to-${var.project_name}"
  provider             = google-beta
  network              = var.network_self_link
  peer_network         = var.host_network_self_link
  import_custom_routes = true
}
resource "google_compute_network_peering" "from-transit" {
  name                 = "vpc-peering-${var.project_name}-to-${var.peering_name}"
  provider             = google-beta
  network              = var.host_network_self_link
  peer_network         = var.network_self_link
  export_custom_routes = true
}
