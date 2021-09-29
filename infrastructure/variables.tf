
###Project creation
#Example : <oraganization name>-SHARED-<DEV / PRD>-<serial number>
variable "ProjectName" {
  default = "SCJ-SHARED-DEV-001"
}

variable "project_id" {
  type    = string
  default = "loyal-network-323915"
}


variable "ProjectIDPrefix" {
  type    = string
  default = "SHARED-DEV-001"
}

variable "FolderID" {
  type    = string
  default = "folders/"
}

variable "BillingAccount" {
  type    = string
  default = "01E8D6-27345B-B081AC"
}


####Labels


variable "Environment" {
  type    = string
  default = "dev"
}


####Network 

variable "NetworkName" {
  type    = string
  default = "vpc-shared-dev-01"
}


#####Subnet US West-1


variable "SubnetName_usw2" {
  type    = string
  default = "sub-prv-usw2-01"
}


variable "SubnetRegion_usw2" {
  type    = string
  default = "us-west2"
}


variable "IP_CIDR_Range_subnet_usw2" {
  type    = string
  default = "10.114.8.0/24"
}

variable "VPCPeeringProName" {
  type    = string
  default = "gcpshareddev001"
}
#Peering_Shared="shared"

variable "Peering_CloudExchange" {
  type    = string
  default = "cloudexchange"
}

######################################################################

variable "peer_external_gateway" {
  description = "Configuration of an external VPN gateway to which this VPN is connected."
  type = object({
    redundancy_type = string
    interfaces = list(object({
      id         = number
      ip_address = string
    }))
  })
  default = null
}

variable "peer_gcp_gateway" {
  description = "Self Link URL of the peer side HA GCP VPN gateway to which this VPN tunnel is connected."
  type        = string
  default     = null
}

variable "name" {
  description = "VPN gateway name, and prefix used for dependent resources."
  type        = string
}

variable "network" {
  description = "VPC used for the gateway and routes."
  type        = string
}


variable "region" {
  description = "Region used for resources."
  type        = string
}

variable "route_priority" {
  description = "Route priority, defaults to 1000."
  type        = number
}

variable "router_advertise_config" {
  description = "Router custom advertisement configuration, ip_ranges is a map of address ranges and descriptions."
  type = object({
    groups    = list(string)
    ip_ranges = map(string)
    mode      = string
  })
  default = null
}

variable "router_asn" {
  description = "Router ASN used for auto-created router."
  type        = number
}

variable "router_name" {
  description = "Name of router, leave blank to create one."
  type        = string
}

variable "tunnels" {
  description = "VPN tunnel configurations, bgp_peer_options is usually null."
  type = map(object({
    bgp_peer = object({
      address = string
      asn     = number
    })
    bgp_peer_options = object({
      advertise_groups    = list(string)
      advertise_ip_ranges = map(string)
      advertise_mode      = string
      route_priority      = number
    })
    bgp_session_range               = string
    ike_version                     = number
    vpn_gateway_interface           = number
    peer_external_gateway_interface = number
    shared_secret                   = string
  }))
  default = {}
}

variable "vpn_gateway_self_link" {
  description = "self_link of existing VPN gateway to be used for the vpn tunnel"
  default     = null
}

variable "create_vpn_gateway" {
  description = "create a VPN gateway"
  default     = true
  type        = bool
}