resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = "t3.micro"

  tags = {
    Name = "test-centos8"
  }
}

data "aws_ami" "centos8" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}
output "instance_profile" {
# value = "aws_instance.web.*.id[1]" -- this will give error bcz id[0] exists there is only 1 instance resource id[1] causes error
  value = try(aws_instance.web.*.id[1], "") # try evaluates all of its argument expressions in turn and returns the result of the first one that does not produce any errors.
}