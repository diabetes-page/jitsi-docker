provider "google" {
  project = var.project
  region = var.region
}

module "vpc" {
  source  = "../../modules/vpc"
  project = var.project
  region = var.region
}

module "gke" {
  source  = "../../modules/gke"
  project = var.project
  region = var.region
  vpc_network = module.vpc.network
  vpc_subnet = module.vpc.subnet
  zones = ["europe-west3-a"]
  gke_num_nodes = 3
}
