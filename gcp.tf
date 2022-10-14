module "kubernetes_cluster" {
  source     = "./modules/gke"
  region     = var.region
  project_id = var.project_id
  env        = var.env
}

# module "kubernetes_config" {
#   source     = "./modules/k8s"
#   region     = var.region
#   project_id = var.project_id
#   env        = var.env
# }

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


