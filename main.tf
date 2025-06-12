module "vpc_resources" {
  source                           = "./modules/vpc"
  region                           = var.region
  vpc_name                         = "${var.vpc_name}-${var.environment}"
  subnet_details                   = var.subnet_details
  vpc_default_firewall_ports       = var.vpc_default_firewall_ports
  vpc_default_firewall_cidr_blocks = var.vpc_default_firewall_cidr_blocks

}


module "gke_cluster" {
  source                  = "./modules/gke"
  project_id              = var.project_id
  vpc_id                  = module.vpc_resources.vpc_id
  subnet_id               = module.vpc_resources.subnets["subnet_1"]
  gke_cluster_name        = "${var.gke_cluster_name}-${var.environment}"
  cluster_location        = var.cluster_location
  node_pool_name          = "${var.node_pool_name}-${var.environment}"
  node_count              = var.node_count
  node_machine_type       = var.node_machine_type
  gke_node_sva_roles      = var.gke_node_sva_roles
  enable_network_policy   = var.enable_network_policy
  network_policy_provider = var.network_policy_provider

}