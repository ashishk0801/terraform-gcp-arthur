output "service_name" {
  description = "The name of the Cloud Run service"
  value       = module.cloud_run.service_name
}

output "service_url" {
  description = "The URL of the Cloud Run service"
  value       = module.cloud_run.service_url
}

output "service_id" {
  description = "The ID of the Cloud Run service"
  value       = module.cloud_run.service_id
}

output "location" {
  description = "The location of the Cloud Run service"
  value       = module.cloud_run.location
}

output "image_url" {
  description = "The full image URL used by the service"
  value       = module.cloud_run.image_url
}
