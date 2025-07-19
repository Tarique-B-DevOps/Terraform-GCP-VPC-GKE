output "cluster_name" {
  value       = google_container_cluster.cluster.name
  description = "The name of the GKE cluster."
}

output "cluster_endpoint" {
  value       = google_container_cluster.cluster.endpoint
  description = "The endpoint for accessing the GKE cluster."
}

output "cluster_location" {
  value       = google_container_cluster.cluster.location
  description = "The location of the GKE cluster."

}