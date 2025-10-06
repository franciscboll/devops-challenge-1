output "bucket_name" {
  value = module.s3_bucket.s3_bucket_id
}

output "vpc_id" {
  value = module.vpc.default_vpc_id
}

output "eks_cluster_name" {
  value       = module.eks.cluster_name
  description = "Nombre del clúster EKS"
}

output "eks_cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "Endpoint del clúster"
}

output "eks_node_group_name" {
  value       = module.eks.eks_managed_node_groups
  description = "Nombre del NodeGroup creado"
}