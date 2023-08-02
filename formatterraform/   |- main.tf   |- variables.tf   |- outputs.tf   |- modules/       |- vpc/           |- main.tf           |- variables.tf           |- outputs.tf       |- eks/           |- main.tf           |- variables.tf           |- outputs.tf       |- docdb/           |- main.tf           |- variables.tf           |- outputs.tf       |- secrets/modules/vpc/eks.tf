variable "vpc_id" {}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster-${var.vpc_id}"
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role-${var.vpc_id}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

output "eks_cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}
