# 1. Required Providers Section
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

# 2. Provider Configuration
#   See documentation:
#      https://registry.terraform.io/providers/hashicorp/local/latest
#
provider "local" {
  # No specific configuration needed for the local provider,
  # but the block is defined here for completeness.
}

# 3. Variable Definition
variable "filename_suffix" {
  type    = string
  default = "complete-example"
}

# 4. Resource Definition
resource "local_file" "modern_example" {
  content  = "Modern Terraform syntax requires explicit provider blocks."
  filename = "${path.module}/file-${var.filename_suffix}.txt"
}