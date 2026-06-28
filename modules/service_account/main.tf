resource "google_service_account" "platform-bootstrap-ci" {
  account_id   = var.service_account_name
  display_name = var.display_name
  project      = var.project_id
}

output "email" {
  value = google_service_account.platform-bootstrap-ci.email
}
output "name" {
  value = google_service_account.platform-bootstrap-ci.name
}