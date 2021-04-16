resource "google_compute_network" "ishim_vpc" {
  project                 = local.project_id
  name                    = "ishim-dev-vpc"
  description             = "A custom VPC in the DEV environment."
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_firewall" "ishim_vpc_firewall_internal" {
  project = local.project_id
  name    = "default-allow-internal"
  network = google_compute_network.ishim_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  description   = "Allow ICMP, TCP, UDP from within the network."
  direction     = "INGRESS"
  disabled      = false
  priority      = 65534
  source_ranges = values(var.gcp_subnet_range_map)


  log_config = {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "ishim_vpc_sn_eu_w1" {
  project       = local.project_id
  name          = "ishim-dev-sn-ew1"
  ip_cidr_range = var.gcp_subnet_range_map["europe-west1"]
  region        = "europe-west1"
  network       = google_compute_network.ishim_vpc.id
  description   = "A subnetwork in the 'europe-west1' region"
}

resource "google_compute_subnetwork" "ishim_vpc_sn_eu_w2" {
  project       = local.project_id
  name          = "ishim-dev-sn-ew2"
  ip_cidr_range = var.gcp_subnet_range_map["europe-west2"]
  region        = "europe-west2"
  network       = google_compute_network.ishim_vpc.id
  description   = "A subnetwork in the 'europe-west2' region"
}

resource "google_compute_subnetwork" "ishim_vpc_sn_eu_w3" {
  project       = local.project_id
  name          = "ishim-dev-sn-ew3"
  ip_cidr_range = var.gcp_subnet_range_map["europe-west1"]
  region        = "europe-west3"
  network       = google_compute_network.ishim_vpc.id
  description   = "A subnetwork in the 'europe-west3' region"
}

