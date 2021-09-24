###  ----------VPN Connection----------

resource "google_compute_ha_vpn_gateway" "gcp-vpn-gw" {
  name    = "gcp-vpn-gw-${var.region}"
  project = var.project_id
  network = var.network_self_link
  region  = var.region
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  ip_protocol = "ESP"
  ip_address  = var.static_ip_address
  target      = google_compute_ha_vpn_gateway.gcp-vpn-gw.self_link
  project     = var.project_id
  region      = var.region
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500-500"
  ip_address  = var.static_ip_address
  target      = google_compute_ha_vpn_gateway.gcp-vpn-gw.self_link
  project     = var.project_id
  region      = var.region
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500-4500"
  ip_address  = var.static_ip_address
  target      = google_compute_ha_vpn_gateway.gcp-vpn-gw.self_link
  project     = var.project_id
  region      = var.region
}

#### ----------VPN Tunnel1---------- 

resource "google_compute_vpn_tunnel" "gcp-tunnel1" {
  name               = var.vpn_tunnel_name
  region             = var.tunnel_region
  peer_ip            = var.peer_ip
  shared_secret      = var.preshared_key
  ike_version        = 2
  project            = var.project_id
  target_vpn_gateway = google_compute_ha_vpn_gateway.gcp-vpn-gw.self_link

  router = google_compute_router.gcp-router1.name

  depends_on = [
    google_compute_forwarding_rule.fr_esp,
    google_compute_forwarding_rule.fr_udp500,
    google_compute_forwarding_rule.fr_udp4500,
  ]
}

resource "google_compute_router" "gcp-router1" {
  name    = var.router_name
  region  = var.router_region
  project = var.project_id
  network = var.network_self_link

  bgp {
    asn = var.asn_number
  }
}

resource "google_compute_router_interface" "router_interface1" {
  name       = var.router_interface_name
  router     = google_compute_router.gcp-router1.name
  region     = google_compute_router.gcp-router1.region
  project    = var.project_id
  ip_range   = var.router_int_ip
  vpn_tunnel = google_compute_vpn_tunnel.gcp-tunnel1.name
}

resource "google_compute_router_peer" "gcp-router1-peer" {
  name            = var.router_peer_name
  router          = google_compute_router.gcp-router1.name
  region          = google_compute_router.gcp-router1.region
  project         = var.project_id
  peer_ip_address = var.router_peer_int_ip
  peer_asn        = var.peer_asn_number
  interface       = google_compute_router_interface.router_interface1.name
}

/*
 * ----------VPN Tunnel2----------
 */
# resource "google_compute_vpn_tunnel" "gcp-tunnel2" {
#   name          = "gcp-tunnel2"
#   peer_ip       = "${aws_vpn_connection.aws-vpn-connection1.tunnel2_address}"
#   shared_secret = "${aws_vpn_connection.aws-vpn-connection1.tunnel2_preshared_key}"
#   ike_version   = 1
#   target_vpn_gateway = "${google_compute_ha_vpn_gateway.gcp-vpn-gw.self_link}"
#   router = "${google_compute_router.gcp-router2.name}"
#   depends_on = [
#     "google_compute_forwarding_rule.fr_esp",
#     "google_compute_forwarding_rule.fr_udp500",
#     "google_compute_forwarding_rule.fr_udp4500",
#   ]
# }
# resource "google_compute_router" "gcp-router2" {
#   name = "gcp-router2"
#   region = "${var.gcp_region}"
#   network = "${google_compute_network.gcp-network.name}"
#   bgp {
#     asn = "${aws_customer_gateway.aws-cgw.bgp_asn}"
#   }
# }
# resource "google_compute_router_peer" "gcp-router2-peer" {
#   name = "gcp-to-aws-bgp2"
#   router  = "${google_compute_router.gcp-router2.name}"
#   region  = "${google_compute_router.gcp-router2.region}"
#   peer_ip_address = "${aws_vpn_connection.aws-vpn-connection1.tunnel2_vgw_inside_address}"
#   peer_asn = "${var.GCP_TUN2_VPN_GW_ASN}"
#   interface = "${google_compute_router_interface.router_interface2.name}"
# }
# resource "google_compute_router_interface" "router_interface2" {
#   name    = "gcp-to-aws-interface2"
#   router  = "${google_compute_router.gcp-router2.name}"
#   region  = "${google_compute_router.gcp-router2.region}"
#   ip_range = "${aws_vpn_connection.aws-vpn-connection1.tunnel2_cgw_inside_address}/${var.GCP_TUN2_CUSTOMER_GW_INSIDE_NETWORK_CIDR}"
#   vpn_tunnel = "${google_compute_vpn_tunnel.gcp-tunnel2.name}"
# }
