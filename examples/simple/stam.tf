# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Terraform configuration

provider "aws" {
  region = "us-east-1"
}


data "aws_ami" "ubuntu" {  
  most_recent      = true
  filter {
    name   = "name"
    values = ["ubuntu*"]
  }

}



resource "aws_instance" "moshe" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t3.micro"
  tags = {
    Name = "Moshe-ec2"
  }
}