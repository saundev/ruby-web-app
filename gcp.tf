resource "google_cloud_run_service" "default" {
  name     = "cloudrun-nginx"
  location = "europe-west2"

  template {
    spec {
      containers {
        image = "europe-west2-docker.pkg.dev/responsive-hall-240812/gcp-saundev-repo/nginx-instance"
        ports {
          container_port = 80
        }
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "4"
        "run.googleapis.com/client-name"   = "terraform"
      }
    }
  }
  autogenerate_revision_name = true
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

# module "kubernetes_cluster" {
#   source     = "./modules/gke"
#   region     = var.region
#   project_id = var.project_id
#   env        = var.env
# }

# module "kubernetes_config" {
#   source     = "./modules/k8s"
#   region     = var.region
#   project_id = var.project_id
#   env        = var.env
# }

