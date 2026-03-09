terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "config" {
  # We use the variables here
  content  = "Deploying ${var.instance_count} instances to ${var.app_region}."
  filename = "${path.module}/deploy_plan.txt"
}