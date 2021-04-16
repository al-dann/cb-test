module "ishim_vpc" {
  source = "github.com/terraform-google-modules/terraform-google-network/modules/vpc"
  # version = "~> 3.2.1"

  # Give the network a name and project
  project_id   = var.gcp_project_id
  network_name = "ishim-dev-vpc"
  description  = "A custom VPC in the DEV environment."
}

module "ishim_vpc_firewall_internal" {
  source = "github.com/terraform-google-modules/terraform-google-network/modules/firewall-rules"

  project_id   = var.gcp_project_id
  network_name = module.ishim_vpc.network_name

  rules = [{
    name                    = "default-allow-internal"
    description             = "Allow ICMP, TCP, UDP from within the network."
    direction               = "INGRESS"
    priority                = 65534
    ranges                  = values(var.gcp_subnet_range_map)
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["0-65535"]
      },
      {
        protocol = "icmp"
      },
      {
        protocol = "udp"
        ports    = ["0-65535"]
      }
    ]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]

}

module "ishim_vpc_sn" {
  source = "github.com/terraform-google-modules/terraform-google-network/modules/subnets"

  project_id   = var.gcp_project_id
  network_name = module.ishim_vpc.network_name

  subnets = [
    {
      subnet_name   = "ishim-dev-sn-ew1"
      subnet_ip     = var.gcp_subnet_range_map["europe-west1"]
      subnet_region = "europe-west1"
    },
    {
      subnet_name   = "ishim-dev-sn-ew2"
      subnet_ip     = var.gcp_subnet_range_map["europe-west2"]
      subnet_region = "europe-west2"
    },

    {
      subnet_name   = "ishim-dev-sn-ew3"
      subnet_ip     = var.gcp_subnet_range_map["europe-west3"]
      subnet_region = "europe-west3"
    }
  ]
}
