output "region" {
  value = var.region
  description = "Google Cloud default region"
}

output "project" {
  value = var.project
  description = "Google Cloud project ID"
}

output "kubernetes_cluster_name" {
  value = module.gke.kubernetes_cluster_name
  description = "GKE cluster name"
}

output "kubernetes_cluster_host" {
  value = module.gke.kubernetes_cluster_host
  description = "GKE cluster host"
}
