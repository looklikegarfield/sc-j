variable "project_id" {
  description = " Enter Project ID to create VPC"
}

variable "network_name" {
  description = "Network name a create on GCP"
}

variable "auto_create_subnetworks" {
  default     = "false"
  description = "Auto-creation of the associated subnet"
}

variable "routing_mode" {
  description = "Sets the network-wide routing mode for Cloud Routers to use. Accepted values are GLOBAL or REGIONAL. Defaults to REGIONAL"
  default     = "REGIONAL"
}

