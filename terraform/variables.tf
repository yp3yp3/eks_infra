variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "staging"
}

variable "vpc_names" {
  description = "VPC names per environment"
  type        = map(string)
  default = {
    staging    = "eks-vpc-staging"
    production = "eks-vpc-production"
  }
}

variable "eks_cluster_names" {
  description = "EKS cluster names per environment"
  type        = map(string)
  default = {
    staging    = "EKS_STAGE"
    production = "EKS_PROD"
  }
}

variable "instance_types" {
  description = "Instance types per environment"
  type        = map(list(string))
  default = {
    staging    = ["t2.small"]
    production = ["t2.medium"]
  }
}

variable "node_count" {
  description = "Number of worker nodes per environment"
  type        = map(number)
  default = {
    staging    = 1
    production = 2
  }
}
