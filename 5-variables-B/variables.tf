# This file does not HAVE to be called variables.tf, but this is a convention.


variable "app_region" {
  type        = string
  description = "The deployment region"
  # No 'default' here, because we want to provide it in the .tfvars file
}

variable "instance_count" {
  type    = number
  default = 1
}
