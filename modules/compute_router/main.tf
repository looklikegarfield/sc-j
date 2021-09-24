resource "google_compute_router" "gcp-router" {
  name        = var.router_name
  region      = var.router_region
  project     = var.project_id
  network     = var.network_self_link
  description = var.description

  bgp {
    asn = var.asn_number
  }
}

