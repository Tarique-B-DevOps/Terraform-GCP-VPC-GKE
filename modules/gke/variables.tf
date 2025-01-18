variable "project_id" {
  description = "GCP project ID"
  type        = string

}

variable "vpc_id" {
  description = "GKE Cluster VPC ID"
  type        = string

}

variable "subnet_id" {
  description = "GKE Cluster Subnet ID"
  type        = string

}

variable "gke_cluster_name" {
  description = "The name of the gke cluster."
  type        = string
}

variable "cluster_location" {
  description = "The zone where cluster and nodes will be deployed"
  type        = string
}

variable "node_pool_name" {
  description = "The name of the nodes pool"
  type        = string
}

variable "node_count" {
  description = "The number of nodes for a node pool"
  type        = number
}

variable "node_machine_type" {
  description = "The name of the nodes pool"
  type        = string
}

variable "gke_ip_allocation_cidrs" {
  description = "IP allocation CIDR blocks for cluster and services"
  type        = map(string)
  default = {
    "cluster" = "/14"
    "service" = "/20"
  }

}

variable "gke_node_sva_roles" {
  description = "Required roles for Node Pool"
  type        = map(string)

}