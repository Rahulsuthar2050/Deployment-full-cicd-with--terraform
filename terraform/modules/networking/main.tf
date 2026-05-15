resource "google_compute_network" "vpc" {
  name                    = "microservices-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "gke-subnet"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/20"

  # Secondary range for Pods
  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "10.1.0.0/16"
  }

  # Secondary range for Services
  secondary_ip_range {
    range_name    = "services-ranges"
    ip_cidr_range = "10.2.0.0/20"
  }
}

# Outputs so the Cluster module can "see" these resources
output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "subnet_id" {
  value = google_compute_subnetwork.subnet.id
}