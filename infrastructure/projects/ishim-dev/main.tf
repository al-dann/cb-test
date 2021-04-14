module "vpc" {
  source  = "github.com/terraform-google-modules/terraform-google-network/modules/subnets"
  # version = "~> 3.2.1"

  # Give the network a name and project
  project_id   = var.gcp_project_id
  network_name = "ishim-dev-vpc"
  description  = "A basic network for developmen tand test purposes"

  subnets = [
    {
      subnet_name   = "ishim-dev--sn-ew2"
      subnet_ip     = "10.154.16.0/24"
      subnet_region = "europe-west2"
    }
  ]
}
