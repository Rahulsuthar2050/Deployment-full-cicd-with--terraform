resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region # Autopilot clusters are regional by default

  # This one line enables GKE Autopilot mode
  enable_autopilot = true

  network    = var.vpc_id
  subnetwork = var.subnet_id

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ranges"
    services_secondary_range_name = "services-ranges"
  }

  # Best practice: link your custom runtime service account
  cluster_autoscaling {
    auto_provisioning_defaults {
      service_account = var.service_account_email
    }
  }
}