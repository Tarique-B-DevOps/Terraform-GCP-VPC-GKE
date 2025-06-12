variable "tags" {
  description = "Common resources tags"
  type        = map(string)

}

variable "project_id" {
  description = "The project ID to deploy resources"
  type        = string
}

variable "region" {
  description = "The region where resources will be deployed"
  type        = string
}

variable "environment" {
  description = "deployment environment"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string


}

variable "subnet_details" {
  description = "Subnet names and CIDR blocks"
  type        = map(any)

}

variable "vpc_default_firewall_ports" {
  description = "Port Numbers to open on default firewall"
  type        = list(string)

}

variable "vpc_default_firewall_cidr_blocks" {
  description = "CIDR Blocks to allow on opened ports on default firewall"
  type        = list(string)

}

# GKE Cluster Variables
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

}

variable "gke_node_sva_roles" {
  description = "Required roles for Node Pool"
  type        = map(string)
}

variable "enable_network_policy" {
  description = "Enable network policy for GKE cluster"
  type        = bool
}

variable "network_policy_provider" {
  description = "Network policy provider for GKE cluster"
  type        = string

}