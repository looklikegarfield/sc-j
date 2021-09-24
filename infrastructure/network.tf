module "network" {
  source       = "../modules/compute_network"
  network_name = var.NetworkName
  project_id   = var.project_id
}

output "network_name" {
  value       = module.network.name
  description = "The unique name of the network"
}

output "network_self_link" {
  value       = module.network.self_link
  description = "The URL of the created resource"
}

module "subnet_usw1" {
  source            = "../modules/compute_subnetwork"
  subnet_name       = "ha-vpn-subnet-4"
  network_self_link = module.network.self_link
  subnet_region     = "us-west1"
  project_id        = var.project_id
  ip_cidr_range     = "10.0.2.0/24"
}

output "subnet_usw1_gateway_address" {
  value       = module.subnet_usw2.gateway_address
  description = "The IP address of the gateway."
}

output "subnet_usw1_self_link" {
  value       = module.subnet_usw2.self_link
  description = "The URL of the created resource"
}

output "subnet_usw1_subnet_region" {
  value = module.subnet_usw2.subnet_region
}


module "subnet_usw2" {
  source            = "../modules/compute_subnetwork"
  subnet_name       = "ha-vpn-subnet-2"
  network_self_link = module.network.self_link
  subnet_region     = "us-east1"
  project_id        = var.project_id
  ip_cidr_range     = "192.168.2.0/24"
}

output "subnet_usw2_gateway_address" {
  value       = module.subnet_usw2.gateway_address
  description = "The IP address of the gateway."
}

output "subnet_usw2_self_link" {
  value       = module.subnet_usw2.self_link
  description = "The URL of the created resource"
}

output "subnet_usw2_subnet_region" {
  value = module.subnet_usw2.subnet_region
}
#########################


module "subnet_usc1" {
  source            = "../modules/compute_subnetwork"
  subnet_name       = "ha-vpn-subnet-3"
  network_self_link = module.network.self_link
  subnet_region     = "us-central1"
  project_id        = var.project_id
  ip_cidr_range     = "10.0.1.0/24"
}

output "subnet_usc1_gateway_address" {
  value       = module.subnet_usc1.gateway_address
  description = "The IP address of the gateway."
}

output "subnet_usc1_self_link" {
  value       = module.subnet_usc1.self_link
  description = "The URL of the created resource"
}

output "subnet_usc1_subnet_region" {
  value = module.subnet_usc1.subnet_region
}

module "subnet_usc2" {
  source            = "../modules/compute_subnetwork"
  subnet_name       = "ha-vpn-subnet-1"
  network_self_link = module.network.self_link
  subnet_region     = "us-central1"
  project_id        = var.project_id
  ip_cidr_range     = "192.168.1.0/24"
}

output "subnet_usc2_gateway_address" {
  value       = module.subnet_usc2.gateway_address
  description = "The IP address of the gateway."
}

output "subnet_usc2_self_link" {
  value       = module.subnet_usc2.self_link
  description = "The URL of the created resource"
}

output "subnet_usc2_subnet_region" {
  value = module.subnet_usc2.subnet_region
}
