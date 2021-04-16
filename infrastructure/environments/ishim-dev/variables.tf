variable "adm_project_id" {
  description = "Taken from the GCP Cloud Build. Terraform backend state file location."
  type        = string
  default     = "ishim-adm"
}

variable "region" {
  description = "The region where resources are created => europe-west2"
  type        = string
  default     = "europe-west2"
}

variable "zone" {
  description = "The zone in the europe-west region for resources"
  type        = string
  default     = "europe-west2-b"
}
# ===========================

variable "gcp_project_id" {
  description = "Google Cloud project identifier"
  default     = "ishim-dev"
}

# ===========================
variable "gcp_subnet_range_map" {
  description = "List of subnet ranges to be used in the project."
  type        = map(string)
}
