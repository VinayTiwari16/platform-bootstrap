resource "google_service_account_iam_member" "github" {
  service_account_id = var.service_account_id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${var.workload_identity_pool_name}/attribute.repository/${var.github_owner}/${var.repository_name}"
}

output "binding_id" {
  value = google_service_account_iam_member.github.id
}
