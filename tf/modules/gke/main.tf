# GKE cluster
resource "google_container_cluster" "jitsi_cluster" {
  name = "${var.project}-jitsi"
  location = var.region
  node_locations = var.zones

  remove_default_node_pool = true
  initial_node_count = 1

  network = var.vpc_network
  subnetwork = var.vpc_subnet
}

# Separately Managed Node Pool
resource "google_container_node_pool" "jitsi_nodes" {
  name = "${google_container_cluster.jitsi_cluster.name}-pool"
  cluster = google_container_cluster.jitsi_cluster.name
  node_count = var.gke_num_nodes
  location = var.region

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project
    }

    machine_type = "e2-medium"
    tags = ["gke-node", "${var.project}-jitsi"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
