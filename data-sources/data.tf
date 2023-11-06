data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

output "ami" {
  value = data.aws_ami.example
}

data "aws_instance" "foo" {
  instance_id = "i-0b57d513ef3cad305"
}

output "instance" {
  value = data.aws_instance.foo.public_ip
}
#Arguments are inputs which we will provide and as an output we will fetch attributes
#most_recent
#name_regex
#owners