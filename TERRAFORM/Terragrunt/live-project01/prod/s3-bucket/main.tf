provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_s3" {
    bucket = "terraform-bucket-2322424222"
    acl = "private"
}
