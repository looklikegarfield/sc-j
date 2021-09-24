variable "project_id" {
  description = " Enter project ID "
}

variable "network_self_link" {
  description = " Enter Network (VPC) self link "
}

variable "static_ip_address" {
  description = " Enter Public IP address name which is already created "
}

variable "region" {
  description = "subnet / router / vpn region."
}

variable "tunnel_region" {
}

variable "router_region" {
}

variable "vpn_tunnel_name" {
}

variable "router_name" {
}

variable "router_interface_name" {
}

variable "router_peer_name" {
}

variable "peer_ip" {
  description = "Remote peer public IP address fro VPN tunnel"
}

variable "preshared_key" {
  description = "shared_secret key for VPN tunne"
}

variable "asn_number" {
  description = "Host router ASN number"
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

