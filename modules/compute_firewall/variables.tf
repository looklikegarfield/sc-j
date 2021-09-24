variable "fw_name" {
  description = "A unique name for the resource, required by GCE"
}

variable "project_id" {
  description = " Enter project ID "
}

variable "network_self_link" {
  description = "The netwrok self link"
}

variable "protocol" {
  description = "The name of the protocol to allow"
}

variable "ports" {
  description = "List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP"
  type        = list(string)
  default     = []
}

variable "source_ranges" {
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  type        = list(string)
  default     = []
}

variable "source_tags" {
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  type        = list(string)
  default     = []
}

variable "target_tags" {
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  type        = list(string)
  default     = []
}

