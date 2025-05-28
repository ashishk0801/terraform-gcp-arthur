locals {
  image_url = "${var.region}-docker.pkg.dev/${var.project_id}/my-app-repo/${var.image_name}:${var.image_tag}"
}

resource "google_cloud_run_v2_service" "main" {
  name     = var.app_name
  location = var.region
  project  = var.project_id

  template {
    scaling {
      min_instance_count = var.min_instances
      max_instance_count = var.max_instances
    }

    containers {
      image = local.image_url
      
      ports {
        container_port = var.port
      }
      
      resources {
        limits = {
          cpu    = var.cpu_limit
          memory = var.memory_limit
        }
      }
      
      dynamic "env" {
        for_each = var.environment_variables
        content {
          name  = env.key
          value = env.value
        }
      }
      
      # Add COMMIT_SHA environment variable if image_tag is not 'latest'
      dynamic "env" {
        for_each = var.image_tag != "latest" ? [1] : []
        content {
          name  = "COMMIT_SHA"
          value = var.image_tag
        }
      }
    }
    
    # Ensure the service account exists and has proper permissions
    service_account = google_service_account.cloud_run_sa.email
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }

  depends_on = [
    google_project_service.cloud_run_api,
    google_service_account.cloud_run_sa
  ]
}

# Service Account for Cloud Run
resource "google_service_account" "cloud_run_sa" {
  account_id   = "${var.app_name}-sa"
  display_name = "Service Account for ${var.app_name}"
  project      = var.project_id
}

# IAM policy to allow unauthenticated access (if enabled)
resource "google_cloud_run_service_iam_binding" "noauth" {
  count = var.allow_unauthenticated ? 1 : 0
  
  location = google_cloud_run_v2_service.main.location
  
  project  = google_cloud_run_v2_service.main.project
  service  = google_cloud_run_v2_service.main.name
  role     = "roles/run.invoker"

  members = [
    "allUsers",
  ]
}

# Ensure Cloud Run API is enabled
resource "google_project_service" "cloud_run_api" {
  project = var.project_id
  service = "run.googleapis.com"

  disable_dependent_services = true
}

# Ensure Artifact Registry API is enabled
resource "google_project_service" "artifact_registry_api" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"

  disable_dependent_services = true
}
