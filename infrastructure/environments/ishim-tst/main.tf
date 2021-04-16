provider "google" {
  project = var.adm_project_id
  region  = var.region
  zone    = var.zone
}

locals {
  project_id = var.gcp_project_id
}
