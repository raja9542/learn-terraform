resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = var.type == "null" ? "t3.micro" : var.type
# if condition is true (var.type == "null"), it is true then true value t3.micro, if condition false false value var,type
  tags = {
    Name = "demo"
  }
}

data "aws_ami" "centos8" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

variable "type" {
  default = "null"
}