variable "project_id" {
  description = "Bootstrap Project ID"
  type        = string
}

variable "project_number" {
  description = "Project number for the workload identity resources"
  type        = string
}

variable "pool_id" {
  description = "Workload Identity Pool ID"
  type        = string
}

variable "provider_id" {
  description = "OIDC Provider ID"
  type        = string
}

variable "github_owner" {
  description = "GitHub Organization/User"
  type        = string
}

variable "repository_name" {
  description = "GitHub Repository"
  type        = string
}