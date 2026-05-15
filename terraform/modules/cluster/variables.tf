variable "project_id" {
  description = "The GCP Project ID where resources will be created"
  type        = string
}

variable "region" {
  description = "The default region for GCP resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The default zone for the GKE cluster nodes"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "voteing-microservices-cluster"
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "voting-microservices-vpc"
}

variable "gke_num_nodes" {
  description = "Number of nodes per zone in the GKE cluster"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "The machine type for the GKE nodes"
  type        = string
  default     = "e2-medium"
}
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC network passed from the networking module"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet passed from the networking module"
}
variable "service_account_email" {
  type        = string
  description = "The service account email that the GKE nodes will run as"
}