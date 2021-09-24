variable "project_id" {
  description = " Enter project ID "
}

variable "subnet_name" {
  description = "Subnet name to create on GCP"
}

# variable "network_name" {
#   description = "Network name where we need to create subnet"
# }

variable "subnet_region" {
  default     = ""
  description = "Zone associated with the subnet. This defaults to the region configured in the provider."
}

variable "ip_cidr_range" {
  description = "IP range to book"
}

variable "network_self_link" {
  description = "network self link"
}

