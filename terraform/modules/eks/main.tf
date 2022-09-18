# A data block requests that Terraform read from a given data source
# and export the result under the given local name.
data "aws_eks_cluster" "cluster" {
  name = module.sample-cluster.cluster_id
}

# A data block requests that Terraform read from a given data source
# and export the result under the given local name.
data "aws_eks_cluster_auth" "cluster" {
  name = module.sample-cluster.cluster_id
}

# A provider block is used to specify a provider configuration
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# ================================================================================
# Define Terraform Settings
# https://www.terraform.io/language/settings
# ================================================================================
# Terraform block used to configure some high-level behaviors of Terraform
terraform {
  # Constraint to specify which versions of Terraform can be used with this configuration,
  required_version = "~> 1.2.0"
  # What provider version to use within this configuration and where to source it from
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.17.0"
    }
  }
}

# ================================================================================
# Define terraform-aws-modules/eks/aws
# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
# ================================================================================
# Module block to call a locally or remotely stored module
module "sample-cluster" {
  source = "terraform-aws-modules/eks/aws"
  # version = "18.29.0"

  cluster_name    = "sample-cluster"
  cluster_version = "1.23"
  subnet_ids      = var.private_subnets
  vpc_id          = var.vpc_id

  eks_managed_node_groups = {
    sample-nodegroup = {
      desired_capacity = 2
      max_capacity     = 4
      min_capacity     = 2
      instance_types   = ["t3.small"]
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
    SystemId    = "sample"
  }
}