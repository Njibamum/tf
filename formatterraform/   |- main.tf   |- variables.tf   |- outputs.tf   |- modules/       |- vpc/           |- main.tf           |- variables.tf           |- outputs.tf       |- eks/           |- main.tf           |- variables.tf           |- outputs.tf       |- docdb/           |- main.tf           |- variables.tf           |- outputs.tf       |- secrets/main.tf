provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

module "vpc1" {
  source = "./modules/vpc"
  cidr   = "10.0.0.0/16"
}

module "vpc2" {
  source = "./modules/vpc"
  cidr   = "10.1.0.0/16"
}

module "eks_cluster_vpc1" {
  source = "./modules/eks"
  vpc_id = module.vpc1.vpc_id
}

module "eks_cluster_vpc2" {
  source = "./modules/eks"
  vpc_id = module.vpc2.vpc_id
}

module "docdb_cluster" {
  source  = "./modules/docdb"
  vpc_id  = module.vpc1.vpc_id
  subnet_ids = module.vpc1.private_subnets
}

module "secrets" {
  source = "./modules/secrets"
  secrets = {
    api_key      = "supersecretapikey"
    db_password  = "secretdbpassword"
  }
}

resource "aws_vpc_peering_connection" "peering_connection" {
  peer_vpc_id = module.vpc1.vpc_id
  vpc_id      = module.vpc2.vpc_id
}

# Outputs
output "eks_clusters" {
  value = [
    module.eks_cluster_vpc1.eks_cluster_id,
    module.eks_cluster_vpc2.eks_cluster_id
  ]
}

output "docdb_cluster_id" {
  value = module.docdb_cluster.cluster_identifier
}
