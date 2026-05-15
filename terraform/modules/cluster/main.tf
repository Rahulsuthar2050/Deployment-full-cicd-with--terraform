resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # We can't create a cluster with no nodes, but we want to delete the 
  # default node pool immediately and create a custom one.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_id
  subnetwork = var.subnet_id

  # Enabling VPC-native traffic routing
  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ranges"
    services_secondary_range_name = "services-ranges"
  }
}

# Custom Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "main-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    preemptible  = true # Set to false for production
    machine_type = var.machine_type

    # Google recommends custom service accounts with minimal permissions
    service_account = var.service_account_email

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}