# variables.tf

# Declare a variable so we can use it.
variable "my_name" {
  description = "My name"
  default = "Yuval"
}

variable "somenum" {
    default = 5
}

variable "stringnum" {
    default = "10"
}


variable "complex" {
  default = {
    name = "John"
    age = 30
    phones = {
      home = "03-1234567"
      mobile = "050-1234567"
    }
  }
}


resource "null_resource" "my-null" {
  provisioner "local-exec" {
    command = "echo The answer is  ${var.somenum + 4}"
  }
}