

# ================================================================================
# Define Input Variables
# https://www.terraform.io/language/values/variables
# ================================================================================
# Input variables let you customize aspects of Terraform modules
# without altering the module's own source code.
variable "vpc_id" {
  description = "VPC ID for k8s."
  type        = string
}
variable "private_subnets" {
  description = "Private subnet IDs for k8s."
  type        = list(string)
}