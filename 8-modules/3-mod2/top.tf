terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


variable "parameter_name" {
  description = "pass to module"
  type        = string
  default     = "david"
}

module "ecmod" {
  source = "./ecmod"
  instance_type = "t3.small"
  top_name = var.parameter_name
}