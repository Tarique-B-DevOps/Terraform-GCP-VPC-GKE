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

output "configure_kubeconfig" {
  description = "Command to Configure Kubeconfig for Kubectl CLI"
  value = "gcloud container clusters get-credentials ${module.gke_cluster.cluster_name} --zone ${module.gke_cluster.cluster_location} --project ${var.project_id}"
  
}