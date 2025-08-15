# AWS Data Sources Terraform Exercise
# Complete the missing parts marked with TODO comments

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

# TODO 1: Create a data source to get information about the current AWS caller identity
# Hint: Use "aws_caller_identity" and name it "current"
data "_______________" "_______________" {
  # This data source doesn't need any arguments
}

# TODO 2: Create a data source to get the latest Amazon Linux 2 AMI
# Hint: Use "aws_ami" and name it "amazon_linux"
data "_______________" "_______________" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# TODO 3: Create a data source to get information about available availability zones
# Hint: Use "aws_availability_zones" and name it "available"
data "_______________" "_______________" {
  state = "available"
}

# TODO 4: Create an output to display caller identity information
# Fill in the missing attributes: account_id, arn, user_id
output "caller_identity_info" {
  description = "Information about the current AWS caller"
  value = {
    account_id = data.aws_caller_identity.current._______________
    arn        = data.aws_caller_identity.current._______________
    user_id    = data.aws_caller_identity.current._______________
  }
}

# TODO 5: Create an output to display AMI information
# Fill in the missing attributes: id, name, creation_date, description, architecture
output "amazon_linux_ami_info" {
  description = "Latest Amazon Linux 2 AMI information"
  value = {
    ami_id          = data.aws_ami.amazon_linux._______________
    name            = data.aws_ami.amazon_linux._______________
    creation_date   = data.aws_ami.amazon_linux._______________
    description     = data.aws_ami.amazon_linux._______________
    architecture    = data.aws_ami.amazon_linux._______________
  }
}

# TODO 6: Create an output to display availability zones information
# Fill in the missing attributes: names, zone_ids
# Also complete the length() function to count zones
output "availability_zones_info" {
  description = "Available availability zones"
  value = {
    zone_names = data.aws_availability_zones.available._______________
    zone_ids   = data.aws_availability_zones.available._______________
    count      = length(data.aws_availability_zones.available._______________)
  }
}

# TODO 7: BONUS - Create a local_file resource to write data to a file
# This demonstrates an alternative way to "print" values
resource "_______________" "data_summary" {
  filename = "aws_data_summary.txt"
  content  = <<-EOT
    AWS Data Sources Summary
    =======================
    
    Current AWS Account: ${data.aws_caller_identity.current._______________}
    User ARN: ${data.aws_caller_identity.current._______________}
    
    Latest Amazon Linux 2 AMI:
    - AMI ID: ${data.aws_ami.amazon_linux._______________}
    - Name: ${data.aws_ami.amazon_linux._______________}
    - Created: ${data.aws_ami.amazon_linux._______________}
    
    Available Zones: ${join(", ", data.aws_availability_zones.available._______________)}
    Total Zones: ${length(data.aws_availability_zones.available._______________)}
  EOT
}

# TODO 8: BONUS - Create a null_resource to print information to console
# This shows another alternative method using provisioners
resource "_______________" "print_to_console" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "_______________" {
    command = <<-EOT
      echo "=== AWS Data Sources Information ==="
      echo "Account ID: ${data.aws_caller_identity.current._______________}"
      echo "AMI ID: ${data.aws_ami.amazon_linux._______________}"
      echo "Availability Zones: ${join(", ", data.aws_availability_zones.available._______________)}"
      echo "=================================="
    EOT
  }

  depends_on = [
    data.aws_caller_identity.current,
    data.aws_ami.amazon_linux,
    data.aws_availability_zones.available
  ]
}