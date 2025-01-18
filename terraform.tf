terraform {
  required_version = ">=1.9.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=6.9.0"
    }
  }
  # backend "gcs" {
  # }
  backend "remote" {

  }
}

provider "google" {
  project = var.project_id
  region  = var.region

  default_labels = var.tags
}