resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  for_each                 = var.subnet_details
  name                     = each.value.name
  ip_cidr_range            = each.value.cidr
  region                   = var.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

resource "google_compute_route" "default_route" {
  count            = 2
  name             = "default-route-${count.index + 1}"
  network          = google_compute_network.vpc_network.id
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}

resource "google_compute_firewall" "default_firewall" {
  name    = "${var.vpc_name}-default-firewall"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = var.vpc_default_firewall_ports
  }

  source_ranges = var.vpc_default_firewall_cidr_blocks
  target_tags   = []
}