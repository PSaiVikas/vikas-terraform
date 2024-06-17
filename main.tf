provider "google" {
  credentials = file("nice-height-421106-dc41b7e1f14f.json")
  project     = var.project_id
  region      = var.region
}

# Enable Cloud Resource Manager API in the GCP project
resource "google_project_service" "cloudresourcemanager_api" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
  # Ensure the API remains enabled even if this resource is destroyed
  disable_on_destroy = false
  timeouts { create = "30m" }
}

# Enable Service Usage API in the GCP project
resource "google_project_service" "serviceusage_api" {
  project = var.project_id
  service = "serviceusage.googleapis.com"
   # Ensure the API remains enabled even if this resource is destroyed
  disable_on_destroy = false
}

# Define your service account (replace with your details)
# data "google_service_account" "default" {
#   account_id = "master-admin@nice-height-421106.iam.gserviceaccount.com"
# }

# # Grant roles to service account (adjust role based on needs)
# resource "google_project_iam_binding" "service_account_roles" {
#   project = var.project_id
#   role    = "roles/redis-admin"  # Adjust role as needed
#   members = [
#     "serviceAccount:${data.google_service_account.default.email}",
#   ]
# }

# Enable Redis API in the GCP project
resource "google_project_service" "redis_api" {
  project = var.project_id
  service = "redis.googleapis.com"
  disable_on_destroy = false

  depends_on = [
    google_project_service.cloudresourcemanager_api,
    google_project_service.serviceusage_api
  ]
}
# Create Redis instance
resource "google_redis_instance" "default" {
# Ensure Redis API is enabled before creating the Redis instance
  depends_on = [google_project_service.redis_api]
  name           = var.redis_instance_name
  memory_size_gb = var.memory_size_gb
  tier           = var.redis_tier
  region         = var.region
  location_id    = var.location_id
  redis_version  = var.redis_version
  display_name   = var.display_name
}