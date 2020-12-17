provider "aws" {
  region = "us-east-2"
  access_key = "access_key"
  secret_key = "secret_key"
}

resource "aws_s3_bucket" "b" {
  bucket = "malhotra-terraform-test1"
  acl = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name = "tf test bucket"
    Environment = "Dev"
  }
}
