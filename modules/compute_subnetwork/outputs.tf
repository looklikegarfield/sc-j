output "gateway_address" {
  value       = google_compute_subnetwork.subnet.gateway_address
  description = "The IP address of the gateway."
}

output "self_link" {
  value       = google_compute_subnetwork.subnet.self_link
  description = "The URL of the created resource"
}

output "subnet_region" {
  value = google_compute_subnetwork.subnet.region
}

