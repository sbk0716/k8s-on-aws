# ================================================================================
# Import terraform-aws-modules/vpc/aws
# ================================================================================
module "k8s-vpc" {
    source = "./modules/vpc"
}

# ================================================================================
# Import terraform-aws-modules/eks/aws
# ================================================================================
# module "eks" {
#     source = "./modules/eks"

#     vpc_id          = module.vpc.vpc_id
#     private_subnets = module.vpc.private_subnets
# }