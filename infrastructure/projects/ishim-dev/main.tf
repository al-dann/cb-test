module "vpc" {
  source  = "git@github.com:github.com/terraform-google-modules/network/google.git"
  version = "~> 3.2.1"

  # Give the network a name and project
  project_id   = var.gcp_project_id
  network_name = "ishim-dev-vpc"

  subnets = [
    {
      subnet_name   = "ishim-dev--sn-ew2"
      subnet_ip     = "10.154.16.0/24"
      subnet_region = "europe-west2"
    }
  ]
}