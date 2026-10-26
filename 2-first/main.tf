# main.tf

# Declare the provider being used, in this case it's AWS.
# This provider supports setting the provider version, AWS credentials as well as the region.
# It can also pull credentials and the region to use from environment variables, which we have set, so we'll use those

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


# declare a resource stanza so we can create something, in this case a key pair
# The aws_key_pair resource is documented here:
#   https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
#

resource "aws_key_pair" "yuval_key_pair" {
  key_name   = "yuval_KP"
  public_key = "write your own public key here"
}
