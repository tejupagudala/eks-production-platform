
output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "node_group_name" {
  value = aws_eks_node_group.this.node_group_name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "platform_admin_role_arn" {
  value       = aws_iam_role.platform_admin.arn
  description = "Role ARN granted cluster-admin via EKS Access Entries"
}