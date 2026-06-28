variable "project_id" {
  description = "Bootstrap Project ID"
  type        = string
}
variable "region" {
  description = "Deployment Region"
  type        = string
}
variable "environment" {
  description = "Environment"
  type        = string
}
variable "bucket_name" {
  description = "Terraform State Bucket"
  type        = string
}
variable "github_owner" {
  description = "GitHub Organization/User"
  type        = string
}
variable "repository_name" {
  description = "Repository Name"
  type        = string
}
variable "github_service_account_name" {
  description = "Name of the GitHub Actions service account"
  type        = string
  default     = "platform-bootstrap-ci"
}

variable "github_service_account_display_name" {
  description = "Display name for the GitHub Actions service account"
  type        = string
  default     = "GitHub Actions CI/CD"
}

variable "workload_identity_pool_id" {
  description = "Workload Identity Pool ID"
  type        = string
  default     = "github-pool"
}

variable "workload_identity_provider_id" {
  description = "Workload Identity Provider ID"
  type        = string
  default     = "github-provider"
}