module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    worker_nodes = {
      name           = "eks-worker-nodes"
      instance_types = lookup(var.instance_types, var.environment, ["t2.small"])
      min_size       = lookup(var.node_count, var.environment, 1)
      max_size       = lookup(var.node_count, var.environment, 1)
      desired_size   = lookup(var.node_count, var.environment, 1)
    }
  }
}

output "cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}
