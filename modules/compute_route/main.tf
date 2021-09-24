##creating new network route
resource "google_compute_route" "default" {
  project                = var.project_name
  name                   = var.route_name
  dest_range             = var.dest_range
  network                = var.network_name
  next_hop_ip            = var.next_hop_ip
  priority               = var.priority
  next_hop_gateway       = var.next_hop_gateway
  next_hop_instance      = var.next_hop_instance
  next_hop_instance_zone = var.next_hop_instance_zone
  next_hop_vpn_tunnel    = var.next_hop_vpn_tunnel
}

