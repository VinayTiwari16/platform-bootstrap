locals {
  common_labels = {
    managed_by  = "terraform"
    platform    = "cloud-foundation"
    owner       = "platform-team"
    environment = var.environment
  }
}

data "google_project" "bootstrap" {
  project_id = var.project_id
}

module "project_services" {
  source     = "./modules/project_services"
  project_id = var.project_id
}


module "github_service_account" {
  source               = "./modules/service_account"
  project_id           = var.project_id
  service_account_name = var.github_service_account_name
  display_name         = var.github_service_account_display_name
}

module "workload_identity" {
  source          = "./modules/workload_identity"
  project_id      = var.project_id
  project_number  = tostring(data.google_project.bootstrap.number)
  pool_id         = var.workload_identity_pool_id
  provider_id     = var.workload_identity_provider_id
  github_owner    = var.github_owner
  repository_name = var.repository_name
}

module "workload_identity_binding" {
  source                      = "./modules/workload_identity_binding"
  project_id                  = var.project_id
  service_account_id          = module.github_service_account.name
  workload_identity_pool_name = module.workload_identity.pool_name
  github_owner                = var.github_owner
  repository_name             = var.repository_name
}

output "project_id" {
  value = var.project_id
}
output "region" {
  value = var.region
}
output "environment" {
  value = var.environment
}
output "bucket_name" {
  value = var.bucket_name
}
output "github_owner" {
  value = var.github_owner
}
output "repository_name" {
  value = var.repository_name
}
output "github_service_account_email" {
  value = module.github_service_account.email
}
output "workload_identity_pool" {
  value = module.workload_identity.pool_name
}
output "oidc_provider" {
  value = module.workload_identity.provider_name
}