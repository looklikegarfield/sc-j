###  ----------VPN Gateway----------

resource "google_compute_vpn_gateway" "gcp-vpn-gw" {
  name    = "gcp-vpn-gw-${var.region}"
  project = var.project_id
  network = var.network_self_link
  region  = var.region
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  ip_protocol = "ESP"
  ip_address  = var.static_ip_address
  target      = google_compute_vpn_gateway.gcp-vpn-gw.self_link
  project     = var.project_id
  region      = var.region
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500-500"
  ip_address  = var.static_ip_address
  target      = google_compute_vpn_gateway.gcp-vpn-gw.self_link
  project     = var.project_id
  region      = var.region
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500-4500"
  ip_address  = var.static_ip_address
  target      = google_compute_vpn_gateway.gcp-vpn-gw.self_link
  project     = var.project_id
  region      = var.region
}

#### ---------Router---------- 

resource "google_compute_router" "gcp-router1" {
  name    = var.router_name
  region  = var.router_region
  project = var.project_id
  network = var.network_self_link

  bgp {
    asn = var.asn_number
  }
}