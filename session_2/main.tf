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
