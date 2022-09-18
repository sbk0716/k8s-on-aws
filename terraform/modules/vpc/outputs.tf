# ================================================================================
# Define Output Values
# https://www.terraform.io/language/values/outputs
# ================================================================================
# Output value for consumption by another module or a human interacting via the UI
output "vpc_id" {
  value       = module.sample-vpc.vpc_id
  description = "VPC ID for sample."
}

# Output value for consumption by another module or a human interacting via the UI
output "private_subnets" {
  value       = module.sample-vpc.private_subnets
  description = "Private subnet IDs for sample."
}