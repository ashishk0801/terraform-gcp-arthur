output "service_name" {
  description = "The name of the Cloud Run service"
  value       = google_cloud_run_v2_service.main.name
}

output "service_url" {
  description = "The URL where the Cloud Run service is accessible"
  value       = google_cloud_run_v2_service.main.uri
}

output "service_id" {
  description = "The unique identifier of the Cloud Run service"
  value       = google_cloud_run_v2_service.main.id
}

output "location" {
  description = "The location where the Cloud Run service is deployed"
  value       = google_cloud_run_v2_service.main.location
}

output "image_url" {
  description = "The full container image URL used by the service"
  value       = local.image_url
}

output "service_account_email" {
  description = "Email of the service account used by Cloud Run"
  value       = google_service_account.cloud_run_sa.email
}
