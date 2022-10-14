provider "google" {
  credentials = file("automation-sa.json")
  project     = var.project_id
  region      = var.region
}
