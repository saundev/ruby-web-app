output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

# output "kubernetes_cluster_name" {
#   value       = google_container_cluster.primary.name
#   description = "GKE Cluster Name"
# }

# output "kubernetes_cluster_host" {
#   value       = google_container_cluster.primary.endpoint
#   description = "GKE Cluster Host"
# }

# output "gcr_location" {
#   value = data.google_container_registry_repository.web-app.repository_url
# }

# output "gcr_location" {
#   value = data.google_container_registry_image.ruby.image_url
# }
