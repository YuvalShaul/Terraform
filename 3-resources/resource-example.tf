# This file contains a data source that search for an AMI.
# To see the AMI it got you can run just "terraform plan".

# 1. Required Providers block (Best practice for version locking)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use a stable 5.x version
    }
  }
}

# 2. Provider block (Configures the connection)
provider "aws" {
  region = "us-east-1" # This determines which region the data source searches
}




# 3. Declaring an EC2 resource.
#    See documentation here:
#       https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
#


resource "aws_instance" "example_server" {
  ami = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"

  tags = {
    Name = "My-EC2"
  }
}

