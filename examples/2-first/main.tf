# main.tf

# Declare the provider being used, in this case it's AWS.
# This provider supports setting the provider version, AWS credentials as well as the region.
# It can also pull credentials and the region to use from environment variables, which we have set, so we'll use those

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


# declare a resource stanza so we can create something, in this case a key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "${var.keyname}KP"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+C+/k6T/7wy7+InYK6qwwSk87hneBpgJtlYEL2B6FB7X5+KOI2OVr6i4wPekXweRMaOOTqF0L68390pErSqKQbYOWUNNymed03csqvtI3x+H1N+ZrN+ajL5C85eh+sSo8mvGMANThue/SuYRe25lAUJWqbK1Sjs0TWBo2KaULx7lTLPFPdj8J03piXt2foZHGNAlo7bfVuVt+EcHTZQCsRKo3eOkhJinXz+7Ol4He+RnPzG2Hb0ZGbJXudSsRfIhUNTgTNlhPxTiHsZc55RPjHsI2zrkVqGno9cXZHo9B1HGuXjcTyyEPW5XGfvOP1gCm4uLu3HLvt9z8ACi4J2vJ osboxes@osboxes"
}
