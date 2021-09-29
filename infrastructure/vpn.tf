module "vpn_ha" {
  source                = "../modules/vpn_ha"
  project_id            = var.project_id
  region                = var.region
  network               = var.network
  name                  = var.name
  peer_external_gateway = var.peer_external_gateway
  router_asn            = var.router_asn
  tunnels               = var.tunnels
}