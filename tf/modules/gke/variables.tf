variable "project" {}

variable "region" {}

variable "zones" {
  type = list(string)
  description = "The zone(s) to host the cluster in (required if is a zonal cluster)"
}

variable "gke_num_nodes" {
  default = 2
  description = "Number of GKE nodes"
  type = number
}

variable "vpc_network" {
  default = "default"
  description = "VPC network in which the cluster should be created"
}

variable "vpc_subnet" {
  default = "default"
  description = "VPC subnet in which the nodes should live"
}
