# main.tf
# Configure the Google Cloud provider
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  # Set your GCP project ID, region, and zone here or as environment variables
  project = "project-a3c6748e-27b0-40e7-b32"
  #credentials = file("/tmp/tmp.Injr0MWqlr/application_default_credentials.json")
  region  = "us-west1"
  zone    = "us-west1-a"
}

# Example resource: Create a VPC network
resource "google_compute_network" "jvb-tf-network" {
  name                    = "jvb-tf-network"
  auto_create_subnetworks = "true"
}

# Create container image repository
resource "google_artifact_registry_repository" "jvb-repo" {
  location      = "us-west1"
  repository_id = "jvb-repository"
  description   = "docker repository"
  format        = "DOCKER"
}
