# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Output variable definitions



output "ec2_instance_public_ip" {
  description = "Public IP addresses of EC2 instance"
  value       = "${aws_instance.moshe.public_ip}"
}

