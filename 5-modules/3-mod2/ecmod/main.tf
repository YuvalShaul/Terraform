data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  
  tags = {
    Name = "${var.top_name}-server"
  }
}

# Generate a random suffix to ensure bucket name uniqueness
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}


# Create S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  # Bucket names should be unique
  # The random_string is a resource from the Random provider

  bucket = "${var.top_name}-bucket-${random_string.bucket_suffix.result}"
}