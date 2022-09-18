# ================================================================================
# Import terraform-aws-modules/vpc/aws
# ================================================================================
module "sample-vpc" {
  source = "./modules/vpc"
}

# ================================================================================
# Import terraform-aws-modules/eks/aws
# ================================================================================
module "sample-eks" {
  source = "./modules/eks"

  vpc_id          = module.sample-vpc.vpc_id
  private_subnets = module.sample-vpc.private_subnets
}