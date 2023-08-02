variable "vpc_id" {}
variable "subnet_ids" {}

resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier = "docdb-cluster"
  engine             = "docdb"
  master_username    = "docdbuser"
  master_password    = var.db_password
  vpc_security_group_ids = [aws_security_group.docdb_sg.id]
  availability_zones     = ["us-west-2a", "us-west-2b"]
}

resource "aws_security_group" "docdb_sg" {
  name_prefix = "docdb-sg"
  vpc_id      = var.vpc_id
}

output "cluster_identifier" {
  value = aws_docdb_cluster.docdb_cluster.cluster_identifier
}
