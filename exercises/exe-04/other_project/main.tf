# main.tf

# Declare the provider being used, in this case it's AWS.
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
  region = "${var.region}"
}

# declare a resource stanza so we can create something.
resource "aws_s3_bucket" "user_bucket" {
  bucket_prefix = "${var.student_name}"
  versioning {
    enabled = true
  }
}

