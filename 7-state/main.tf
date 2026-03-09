provider "aws" {
  region = "us-east-1" # Change this to your preferred region
}

resource "aws_security_group" "state_exercise" {
  name        = "terraform-state-demo"
  description = "A resource to practice state commands"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "StateDemo"
  }
}

output "security_group_id" {
  value = aws_security_group.state_exercise.id
}