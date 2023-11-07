provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "centos8" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}
resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "test-centos8"
  }
  # provisioners can be inside the resource also but if provisioner fails the whole instance recreation occurs.. to avoid this we create provisoners in null_resources
#  provisioner "remote-exec" {
#    connection {
#      host = self.public_ip
#      user = "centos"
#      password = "DevOps321"
#    }
#
#    inline = [
#      "echo Hello"
#    ]
#
#  }
}

resource "null_resource" "provision" {

  triggers = {
    instance_id = aws_instance.web.id  # instance_id any variable..triggers null resource when new instance created
  }
  provisioner "remote-exec" {
    connection {
      host = aws_instance.web.public_ip
      user = "centos"
      password = "DevOps321"
    }

    inline = [
    "echo Hello"
    ]

  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
