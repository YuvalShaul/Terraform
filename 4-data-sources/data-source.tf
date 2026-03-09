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

# 3. Data Source (The "Lookup" item)
#   See documentation here:
#        https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami.html
#

data "aws_ami" "standard_amazon_linux" {
  most_recent = true
  owners      = ["amazon"] # Ensures you get the official image from AWS

  # This filter targets the standard Amazon Linux 2023 image
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# 4. Usage Example (How to use the data you just got)
resource "aws_instance" "example_server" {
  ami           = data.aws_ami.standard_amazon_linux.id
  instance_type = "t3.micro"

  tags = {
    Name = "MyAutomatedServer"
  }
}

# 5. Output (Optional: Print the ID to the terminal)
output "found_ami_id" {
  value = data.aws_ami.standard_amazon_linux.id
}