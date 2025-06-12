resource "google_service_account" "gke_node_sa" {
  account_id   = "${var.gke_cluster_name}-node-sva"
  display_name = "GKE Node Service Account"
}

resource "google_project_iam_member" "gke_node_sa_roles" {
  for_each = var.gke_node_sva_roles
  project  = var.project_id
  role     = "roles/${each.value}"
  member   = "serviceAccount:${google_service_account.gke_node_sa.email}"
}

resource "google_container_cluster" "cluster" {
  name               = var.gke_cluster_name
  location           = var.cluster_location
  initial_node_count = 1

  network    = var.vpc_id
  subnetwork = var.subnet_id

  deletion_protection      = false
  remove_default_node_pool = true

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.gke_ip_allocation_cidrs["cluster"]
    services_ipv4_cidr_block = var.gke_ip_allocation_cidrs["service"]
  }

  network_policy {
    enabled  = var.enable_network_policy
    provider = var.network_policy_provider
  }
}

resource "google_container_node_pool" "nodes" {
  name       = var.node_pool_name
  cluster    = google_container_cluster.cluster.name
  location   = var.cluster_location
  node_count = var.node_count

  node_config {
    machine_type    = var.node_machine_type
    preemptible     = false
    service_account = google_service_account.gke_node_sa.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
