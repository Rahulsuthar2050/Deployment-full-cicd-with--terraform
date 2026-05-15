resource "google_artifact_registry_repository" "microservices" {
  location      = "us-central1"
  repository_id = "microservices-docker-repo"
  description   = "GCP Artifact Registry for microservices"
  format        = "DOCKER"
}

output "repo_url" {
  value = google_artifact_registry_repository.microservices.name
}