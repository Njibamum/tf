output "eks_cluster_id" {
  description = "The ID of the created EKS cluster."
  value       = aws_eks_cluster.eks_cluster.id
}
