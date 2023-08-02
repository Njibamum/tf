variable "vpc_id" {
  description = "The ID of the VPC where the DocumentDB cluster will be created."
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the DocumentDB cluster."
}

variable "db_password" {
  description = "The password for the DocumentDB cluster."
}
