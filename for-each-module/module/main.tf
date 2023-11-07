# if data is Map
resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}

data "aws_ami" "centos8" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

#output "public_ip" {
#  value = {
#    for k, v in aws_instance.web : k => v.public_ip
#  }
#}

variable "name" {}
variable "instance_type" {}

# send output data to modules and in modules we consume it
output "ec2" {
  value = aws_instance.web
}