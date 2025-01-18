output "vpc_name" {
  value = module.vpc_resources.vpc_name

}

output "vpc_id" {
  value = module.vpc_resources.vpc_id
}

output "cluster_name" {
  value = module.gke_cluster.cluster_name

}

output "cluster_endpoint" {
  value = module.gke_cluster.cluster_endpoint

}