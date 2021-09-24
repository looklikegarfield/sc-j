resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  region                   = var.subnet_region
  project                  = var.project_id
  network                  = var.network_self_link
  ip_cidr_range            = var.ip_cidr_range
  private_ip_google_access = "true"
  
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

