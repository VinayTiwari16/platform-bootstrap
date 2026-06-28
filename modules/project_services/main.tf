locals {
  services = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "artifactregistry.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "storage.googleapis.com"
  ]

}

resource "google_project_service" "services" {
  for_each = toset(local.services)
  service = each.key
  project = var.project_id
  disable_on_destroy = false

}


output "enabled_services" {
  value = keys(google_project_service.services)
}