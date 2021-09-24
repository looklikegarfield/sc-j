resource "google_compute_subnetwork_iam_member" "iam_subnet" {
  subnetwork = var.subnet_id
  role       = var.role
  member     = var.member
  region     = var.region
  project    = var.project_id
}

