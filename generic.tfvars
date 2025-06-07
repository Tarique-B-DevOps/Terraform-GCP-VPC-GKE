#Common Values
environment = "staging"
tags = {
  "env"            = "staging"
  "app"            = "core"
  "deploymenttype" = "kubernetes-gke"
}

#VPC Values
region   = "us-central1"
vpc_name = "core"
subnet_details = {
  subnet_1 = {
    name = "core-subnet-1"
    cidr = "10.0.1.0/24"
  }
  subnet_2 = {
    name = "core-subnet-2"
    cidr = "10.0.2.0/24"
  }
}
vpc_default_firewall_ports       = ["80", "443"]
vpc_default_firewall_cidr_blocks = ["0.0.0.0/0"]


#GKE Cluster Values
gke_cluster_name  = "core"
cluster_location  = "us-central1-a"
node_pool_name    = "core"
node_count        = 1
node_machine_type = "e2-standard-4"
gke_ip_allocation_cidrs = {
  "cluster" = "/14"
  "service" = "/20"
}
gke_node_sva_roles = {
  "storage"    = "storage.objectViewer"
  "artifact"   = "artifactregistry.reader"
  "operations" = "container.defaultNodeServiceAccount"
}



