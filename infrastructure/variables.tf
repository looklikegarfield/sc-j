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

#####Terraform service account
#TF_Service_account_id = "sa-gilead-hprj-terraform-dev"
#
#####creating Power user and normal user Role
#DevopsUser_Group = "ent_gcp_devops_cloud_admin_test"
#NetworkUser_Group = "ent_gcp_network_admins-test"
#SecurityUser_Group = "ent_gcp_security_admins-test"

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

######Subnet US East-4
#SubnetName_use4 = "sub-prv-use4-01"
#
#SubnetRegion_use4 = "us-east4"
#
#IP_CIDR_Range_subnet_use4 = "10.115.8.0/24"
#
######Subnet US Central
#SubnetName_usc1 = "sub-prv-usc1-01"
#
#SubnetRegion_usc1 = "us-central1"
#
#IP_CIDR_Range_subnet_usc1 = "10.125.8.0/24"
#
##
##VPC Peering name in Cloud Exchange VPC
##

variable "VPCPeeringProName" {
  type    = string
  default = "gcpshareddev001"
}
#Peering_Shared="shared"

variable "Peering_CloudExchange" {
  type    = string
  default = "cloudexchange"
}


###########################
#
#
#variable "network_self_link" {
#  description = " Enter Network (VPC) self link "
#}
#
#variable "static_ip_address" {
#  description = " Enter Public IP address name which is already created "
#}
#
#variable "region" {
#  description = "subnet / router / vpn region."
#}
#
#variable "tunnel_region" {
#}
#
#variable "router_region" {
#}
#
#variable "vpn_tunnel_name" {
#}
#
#variable "router_name" {
#}
#
#variable "router_interface_name" {
#}
#
#variable "router_peer_name" {
#}
#
#variable "peer_ip" {
#  description = "Remote peer public IP address fro VPN tunnel"
#}
#
#variable "preshared_key" {
#  description = "shared_secret key for VPN tunne"
#}
#
#variable "asn_number" {
#  description = "Host router ASN number"
#}
#
#variable "peer_asn_number" {
#  description = "Remote router ASN number"
#}
#
#variable "router_int_ip" {
#  description = "Router interface IP address"
#}
#
#variable "router_peer_int_ip" {
#  description = "Remote peer Router interface IP address"
#}