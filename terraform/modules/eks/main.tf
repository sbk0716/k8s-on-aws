# data "aws_eks_cluster" "cluster" {
#   name = module.my-cluster.cluster_id
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = module.my-cluster.cluster_id
# }

# terraform {
#   required_providers {
#     kubernetes = {
#       source = "hashicorp/kubernetes"
#       version = "2.3.2"
#     }
#   }
# }

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
# }


# ================================================================================
# Define terraform-aws-modules/eks/aws
# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
# ================================================================================
# module "my-cluster" {
#   source          = "terraform-aws-modules/eks/aws"
#   version         = "17.1.0"

#   cluster_name    = "my-cluster"
#   cluster_version = "1.20"
#   subnets         = var.private_subnets
#   vpc_id          = var.vpc_id

#   node_groups = {
#     my-nodegroup = {
#       desired_capacity = 2
#       max_capacity     = 2
#       min_capacity     = 2
#       instance_types   = ["t3.small"]
#     }
#   }
# }