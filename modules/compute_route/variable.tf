variable "project_name" {
  description = " Enter Project Name name we need to define the route"
}

variable "dest_range" {
  description = " Enter Destination Range (ex: 15.0.0.0/24)"
}

variable "network_name" {
  description = " Enter Network name where we need to define the route"
}

variable "priority" {
  description = "The priority of the route. Defaults to 1000"
  default     = 1000
}

variable "route_name" {
  description = " Enter route name "
}

variable "next_hop_ip" {
  description = " Enter next hop IP address (ex: 10.0.1.5)"
  default     = ""
}

variable "next_hop_gateway" {
  description = "The URL of the internet gateway to route to if this route is matched. The alias default-internet-gateway can also be used."
  default     = ""
}

variable "next_hop_instance" {
  description = "The name of the VM instance to route to if this route is matched"
  default     = ""
}

variable "next_hop_instance_zone" {
  description = "(Required when next_hop_instance is specified) The zone of the instance specified in next_hop_instance"
  default     = ""
}

variable "next_hop_vpn_tunnel" {
  description = "The name of the VPN to route to if this route is matched"
  default     = ""
}

