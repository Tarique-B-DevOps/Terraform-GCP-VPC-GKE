output "vpc_id" {
  description = "VPC ID"
  value       = google_compute_network.vpc_network.id

}
output "vpc_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc_network.name
}

output "subnets" {
  description = "created subnets"
  value       = { for key, subnet in google_compute_subnetwork.subnets : key => subnet.id }

}