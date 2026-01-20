provider "aws" {
  region = "us-east-2"
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = var.use_nat_gateway
  single_nat_gateway = var.use_nat_gateway

    # 🔑 THIS IS THE FIX
  map_public_ip_on_launch = true

    # 🔑 REQUIRED FOR EKS NODE GROUPS
  public_subnet_tags = {
    "kubernetes.io/cluster/portfolio-eks" = "shared"
    "kubernetes.io/role/elb"              = "1"
  }
    private_subnet_tags = {
    "kubernetes.io/cluster/portfolio-eks" = "shared"
    "kubernetes.io/role/internal-elb"     = "1"
  }
}


locals {
  eks_subnet_ids = var.use_nat_gateway ? module.vpc.private_subnets : module.vpc.public_subnets
}


module "eks" {
  source              = "./modules/eks"
  cluster_name        = "portfolio-eks"
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = local.eks_subnet_ids
  ssh_key_name        = var.ssh_key_name
  node_instance_types = ["t3.micro"]
    # ...your existing module inputs...
  cluster_version = var.cluster_version
}