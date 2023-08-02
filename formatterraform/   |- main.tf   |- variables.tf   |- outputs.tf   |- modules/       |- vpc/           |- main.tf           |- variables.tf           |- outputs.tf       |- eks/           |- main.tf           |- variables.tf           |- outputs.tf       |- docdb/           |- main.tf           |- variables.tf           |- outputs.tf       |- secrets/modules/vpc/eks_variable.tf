variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created."
}

variable "subnet_ids" {
  description = "The list of subnet IDs to launch EKS cluster resources."
}
