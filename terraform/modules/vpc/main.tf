# ================================================================================
# Define terraform-aws-modules/vpc/aws
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
# ================================================================================
# Module block to call a locally or remotely stored module
module "k8s-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  # version = "3.14.4"

  name = "k8s-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true  # Use one NAT GW to reduce costs.
  enable_vpn_gateway = false # VPN GW is not necessary

  tags = {
    Terraform   = "true"
    Environment = "dev"
    SystemId    = "k8s"
  }
}