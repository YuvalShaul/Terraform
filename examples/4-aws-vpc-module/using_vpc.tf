terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6" # which means any version equal & above
    }
  }
  required_version = ">= 0.13"
}


provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "yuv-name"

  cidr = "10.5.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.5.1.0/24", "10.5.2.0/24", "10.5.3.0/24"]
  public_subnets  = ["10.5.101.0/24", "10.5.102.0/24", "10.5.103.0/24"]


  enable_nat_gateway = false
  single_nat_gateway = false

  public_subnet_tags = {
    Name = "yuv-public"
  }

  tags = {
    Owner       = "yuval"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "yuval-tag"
  }
}
