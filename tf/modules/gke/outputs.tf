output "kubernetes_cluster_name" {
  value = google_container_cluster.jitsi_cluster.name
  description = "GKE cluster name"
}

output "kubernetes_cluster_host" {
  value = google_container_cluster.jitsi_cluster.endpoint
  description = "GKE cluster host"
}
