# ================================================================================
# Define Output Values
# https://www.terraform.io/language/values/outputs
# ================================================================================
# Output value for consumption by another module or a human interacting via the UI
output "vpc_id" {
  value       = module.k8s-vpc.vpc_id
  description = "VPC ID for k8s."
}

# Output value for consumption by another module or a human interacting via the UI
output "private_subnets" {
  value       = module.k8s-vpc.private_subnets
  description = "Private subnet IDs for k8s."
}