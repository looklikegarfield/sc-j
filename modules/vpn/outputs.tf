#output "vpn_gw_link" {
#  value = google_compute_vpn_gateway.gcp-vpn-gw.self_link
#}

output "router_link" {
  value = google_compute_router.gcp-router1.self_link
}

output "router_region" {
  value = google_compute_router.gcp-router1.region
}

output "router_name" {
  value = google_compute_router.gcp-router1.name
}

