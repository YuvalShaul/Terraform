# variables.tf

# Declare a variable so we can use it.
variable "my_name" {
  description = "My name"
  default     = "Yuval"
}

variable "your_name" {
  description = "Your name"
  default     = ""
}

variable "somenum" {
  default = 5
}

variable "stringnum" {
  default = "10"
}

variable "gap-strings" {
  default = ["aa aa", "bb bb", "cc cc"]
}

variable "my-heredoc" {
  default = <<END
  line 1
    line 2
  line 3
  END
}


variable "complex" {
  default = {
    name = "John"
    age  = 30
    phones = {
      home   = "03-1234567"
      mobile = "050-1234567"
    }
  }
}

variable "map-of-maps" {
  default = {
    John = { 
    name = "John"
    age  = 3
    },
    Dave = { 
    name = "Dave"
    age  = 5
    },
    Mike = { 
    name = "Mike"
    age  = 7
    }
  }
}

resource "null_resource" "my-null" {
  provisioner "local-exec" {
    command = "echo The answer is  ${var.somenum + 4}"
  }
}

