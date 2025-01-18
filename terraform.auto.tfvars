#Common Values
environment = "staging"
tags = {
  "env"            = "staging"
  "app"            = "generic"
  "deploymenttype" = "kubernetes-gke"
}

#VPC Values
project_id = "staging-441107"
region     = "us-central1"
vpc_name   = "generic"
subnet_details = {
  subnet_1 = {
    name = "generic-subnet-1"
    cidr = "10.0.1.0/24"
  }
  subnet_2 = {
    name = "generic-subnet-2"
    cidr = "10.0.2.0/24"
  }
}
vpc_default_firewall_ports       = ["80", "443"]
vpc_default_firewall_cidr_blocks = ["0.0.0.0/0"]


#GKE Cluster Values
gke_cluster_name  = "generic"
cluster_location  = "us-central1-a"
node_pool_name    = "generic"
node_count        = 2
node_machine_type = "e2-medium"
gke_ip_allocation_cidrs = {
  "cluster" = "/14"
  "service" = "/20"
}
gke_node_sva_roles = {
  "storage"  = "storage.objectViewer"
  "artifact" = "artifactregistry.reader"
}


