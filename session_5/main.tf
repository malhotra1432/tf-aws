provider "aws" {
  region = "us-east-2"
  profile = "malhotra-personal"
}

resource "aws_s3_bucket" "b" {
  bucket = "malhotra-tf-test"
  acl = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name = "tf test"
    Environment = "Dev"
  }
}

resource "aws_default_vpc" "tf-default-vpc" {}

resource "aws_security_group" "prod-web" {
  name = "prod-web"
  description = "gonna allow http and https ports inbound and all outbound"

  ingress {
    description = "for http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "for https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}

resource "aws_instance" "prod-web" {
  ami           = "ami-03def2a1f974a030c"
  instance_type = "t2.nano"

  vpc_security_group_ids = [aws_security_group.prod-web.id]

  tags = {
    Name = "HelloWorld"
  }
}
