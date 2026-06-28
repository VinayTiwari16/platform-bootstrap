resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = var.pool_id
  display_name = "GitHub Workload Identity Pool"
  description = "OIDC Pool for GitHub Actions"
  project = var.project_number
}


resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_id = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name = "GitHub Provider"
  project = var.project_number
  attribute_mapping = {
    "google.subject" = "assertion.sub"
    "attribute.actor" = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  attribute_condition = "assertion.repository == '${var.github_owner}/${var.repository_name}'"
}

resource "google_service_account_iam_member" "github" {
  service_account_id = var.service_account_email
  role = "roles/iam.workloadIdentityUser"
  member = "principalSet://iam.googleapis.com/${var.workload_identity_pool_name}/attribute.repository/${var.github_owner}/${var.repository_name}"
}

output "pool_name" {
  value = google_iam_workload_identity_pool.github.name
}
output "provider_name" {
  value = google_iam_workload_identity_pool_provider.github.name
}
output "binding" {
  value = google_service_account_iam_member.github.id
}