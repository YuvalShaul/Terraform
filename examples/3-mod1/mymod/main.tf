variable "param1" {
  type = string
}


resource null_resource "stam" {
    provisioner local-exec {
        command = "echo I got: ${var.param1} from main module."
    }
}

output "plusone" {
value = "${var.param1 + 1}"
}

  