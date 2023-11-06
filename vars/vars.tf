variable "sample" {
  default = 10
}

output "sample" {
  value = var.sample
}

# string data type

variable "sample1" {
  default = "Hello World"
}

output "sample1" {
  value = var.sample1
}

# Number data type

variable "sample2" {
  default = 100
}

output "sample2" {
  value = var.sample2
}

# Boolean data type

variable "sample3" {
  default = true
}

output "sample3" {
  value = var.sample3
}

# Default variable type

variable "sample4" {
  default = "Hello Raja"
}

output "sample4" {
  value = var.sample4
}

# List variable type

variable "sample5" {
  default = [
  100,
  "xyz",
  "abc"
  ]
}
# indexing starts from 0 1 2 3... we need 2nd value
output "sample5" {
  value = var.sample5[1]
}

# Map variable type

variable "sample6" {
  default= {
    number= 10
    string= "Hello"
    boolean = "true"
  }
}

output "sample6" {
  value = var.sample6["number"]
}

# variables from tfvars

variable "demo1" {}

output "demo1" {
  value = var.demo1
}

