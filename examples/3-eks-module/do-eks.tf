# main.tf - Using terraform-aws-modules for both VPC and EKS

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "myVPC" {
  source = "terraform-aws-modules/vpc/aws"

  name = "myVPC"

  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

}

# EKS Module from terraform-aws-modules
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"
  kubernetes_version = "1.29"  # ← Make sure this is explicitly set

  # For v21.x, use these argument names:
  name            = "myEKS"              # ← Changed from cluster_name to name
  
  vpc_id     = module.myVPC.vpc_id
  subnet_ids = module.myVPC.private_subnets
  
  endpoint_public_access  = true           # ✅ No cluster_ prefix
  endpoint_private_access = true           # ✅ No cluster_ prefix

  
  eks_managed_node_groups = {
    spot_nodes = {
      name = "spot-nodes"
      
      min_size     = 0
      max_size     = 2
      desired_size = 2
      
      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
      ami_type = "AL2_x86_64"
      
      labels = {
        Environment = "dev"        # ← Fixed: hardcoded instead of var
        NodeGroup   = "spot-nodes"
      }
      
      tags = {
        Name        = "myEKS-spot-nodes"  # ← Fixed: hardcoded
        Owner       = "Yuval"
        Environment = "dev"
      }
    }
  }


   # Cluster addons
  addons = {
    coredns = {}
    kube-proxy = {}
    vpc-cni = {}
    aws-ebs-csi-driver = {}
  }

}