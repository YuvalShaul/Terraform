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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCre9Vw4KmZ/C1RPLkLEW/ynq1ohupoKARoQpMiwVUlXTMamXR9bQTfNXRQmCtSNHaIU/Ofcx8afQ9H7SJUwuXfQfbykfl8Kqy8opGyXKeCF6t5fOMUtc07uuFOAfcJskAJYIhdHHymx9xj9VuXDFqxwB/g4G+cSZqaFeH6t0SwkK9ROrss26wB9ScTt9+iVHZMIdsPIwimYhd7pCevXh8QXP9wJdlMGkDRoAfkT5O6Jl53mivqnonfeZR7SpRkBEeZhY3kzn07trM+KqPAr67HXf9bSB6WVjus3QzKW6E7jjWLfIfF/EHy5E5HWF8fuEczcQuWYVm2ZuE7d+nbi66l"
}
