resource "google_compute_firewall" "firewall" {
  name    = var.fw_name
  network = var.network_self_link
  project = var.project_id
  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  source_ranges = var.source_ranges
  source_tags   = var.source_tags
  target_tags   = var.target_tags
}

