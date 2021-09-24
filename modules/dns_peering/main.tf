resource "google_dns_managed_zone" "gilead-peering-zone" {
  provider = google-beta

  name        = "gilead-com"
  dns_name    = "gilead.com."
  description = "Gilead private DNS peering zone"
  project     = var.project_id

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network_selflink
    }
  }

  peering_config {
    target_network {
      network_url = var.peer_network_selflink
    }
  }
}

resource "google_dns_managed_zone" "gilead-peering-zone" {
  provider = google-beta

  name        = "gilead-com"
  dns_name    = "gilead.com."
  description = "Gilead private DNS peering zone"
  project     = var.project_id

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network_selflink
    }
  }

  peering_config {
    target_network {
      network_url = var.peer_network_selflink
    }
  }
}

resource "google_dns_managed_zone" "science-peering-zone" {
  provider = google-beta

  name        = "science-gilead-com"
  dns_name    = "science.gilead.com."
  description = "Gilead private DNS peering zone"
  project     = var.project_id

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network_selflink
    }
  }

  peering_config {
    target_network {
      network_url = var.peer_network_selflink
    }
  }
}
