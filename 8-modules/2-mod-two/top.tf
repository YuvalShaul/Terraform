terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    # random_string (used in ./ecmod) comes from the hashicorp/random provider
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
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