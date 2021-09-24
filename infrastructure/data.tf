#data "google_projects" "host_project" {
#    filter = "id:cloud-exchange-dev-1"
#}
#data "google_compute_network" "host_network" {
#  name = "test-vpc-10-113-0-0"
#  project = data.google_projects.host_project.projects[0].project_id
#}
#output "cxprojectname" {
#    value = data.google_projects.host_project.projects[0].project_id
#}
#output "cxproject_subnets" {
#  value = data.google_compute_network.host_network.subnetworks_self_links
#}
#output "cxproject_network_self_link" {
#value = data.google_compute_network.host_network.self_link
#}
#