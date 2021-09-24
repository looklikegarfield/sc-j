variable "project_id" {
  description = " Enter project ID "
}

variable "tunnel_region" {
  description = "vpn tunnel region."
}

variable "router_region" {
  description = " router region."
}

variable "vpn_tunnel_name" {
}

variable "router_name" {
}

variable "router_interface_name" {
}

variable "router_peer_name" {
}

variable "vpn_gateway_self_link" {
}

variable "peer_ip" {
  description = "Remote peer public IP address fro VPN tunnel"
}

variable "preshared_key" {
  description = "shared_secret key for VPN tunne"
}

variable "peer_asn_number" {
  description = "Remote router ASN number"
}

variable "router_int_ip" {
  description = "Router interface IP address"
}

variable "router_peer_int_ip" {
  description = "Remote peer Router interface IP address"
}

# variable "remote_traffic_selector" {
#   description = "Specifies which CIDR ranges the VPN tunnel can route to the remote side"
#   default     = []
# }
