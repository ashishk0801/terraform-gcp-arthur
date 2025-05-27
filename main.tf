terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "poc-tasks"
    workspaces {
      name = "terraform-gcp-ws"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region

  impersonate_service_account = "terraform-cloud-sa@extreme-hull-460509-u7ajdn.iam.gserviceaccount.com"
}

module "cloud_run" {
  source = "./modules/cloud_run"
  
  project_id   = var.project_id
  region       = var.region
  app_name     = var.app_name
  image_name   = var.image_name
  image_tag    = var.image_tag
  port         = var.port

  
  environment_variables = var.environment_variables
  
  min_instances = var.min_instances
  max_instances = var.max_instances
  
  cpu_limit    = var.cpu_limit
  memory_limit = var.memory_limit
  
  allow_unauthenticated = var.allow_unauthenticated
}
