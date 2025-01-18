variable "region" {
  description = "The region where resources will be deployed"
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