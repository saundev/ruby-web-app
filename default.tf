module "kubernetes-cluster" {
  source  = "./modules/gke-cluster"
  version = "23.2.0"
  project = var.project_id
  region  = var.region
}

# data "google_container_registry_repository" "web-app" {
#   project = var.project_id
#   region  = var.region
# }

# data "google_container_registry_image" "ruby" {
#   name    = "ruby"
#   project = var.project_id
#   region  = var.region
# }

# resource "google_container_registry" "registry" {
#   project  = var.project_id
#   location = "EU"
# }

# resource "google_storage_bucket_iam_member" "viewer" {
#   bucket = google_container_registry.registry.id
#   role   = "roles/storage.objectViewer"
#   member = "user:therewillbewolves@gmail.com"
# }


