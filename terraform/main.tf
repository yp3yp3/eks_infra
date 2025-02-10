terraform {
  backend "s3" {
     bucket         = "tf-state-test-987234" # REPLACE WITH YOUR BUCKET NAME
     key            = "example/staging/terraform.tfstate"
     region         = "us-east-1"
     dynamodb_table = "terraform-state-locking"
     encrypt        = true
   }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

locals {
  vpc_name     = lookup(var.vpc_names, var.environment, "eks-vpc-staging")
  cluster_name = lookup(var.eks_cluster_names, var.environment, "EKS_STAGE")
}

