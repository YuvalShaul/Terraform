terraform {
  required_providers {
    # The module declares its own provider requirements too
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

variable "param1" {
  type = number
}

resource "null_resource" "stam" {
  provisioner "local-exec" {
    command = "echo I got: ${var.param1} from main module."
  }
}

output "plusone" {
  value = var.param1 + 1
}
