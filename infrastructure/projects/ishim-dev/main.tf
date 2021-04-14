module "vpc" {
  source  = urlencode("github.com/terraform-google-modules/terraform-google-network/modules/vpc?ref=v3.2.1")
  # version = "~> 3.2.1"

  # Give the network a name and project
  project_id   = var.gcp_project_id
  network_name = "ishim-dev-vpc"
  description  = "test network description"

  # subnets = [
  #   {
  #     subnet_name   = "ishim-dev-sn-ew2"
  #     subnet_ip     = "10.154.16.0/24"
  #     subnet_region = "europe-west2"
  #   }
  # ]
}
