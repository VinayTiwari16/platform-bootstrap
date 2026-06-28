variable "project_id" {
  description = "Bootstrap Project ID"
  type        = string
}

variable "service_account_id" {
  description = "Resource ID of the service account to bind"
  type        = string
}

variable "workload_identity_pool_name" {
  description = "Name of the workload identity pool"
  type        = string
}

variable "github_owner" {
  description = "GitHub organization or user"
  type        = string
}

variable "repository_name" {
  description = "GitHub repository name"
  type        = string
}
