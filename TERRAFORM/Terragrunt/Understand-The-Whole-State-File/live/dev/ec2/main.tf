/*
terraform {
  backend "s3" {}
  required_version = ">= 0.12.26" # Required for compatibility with TF 13 style provider block

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 2.60" # Required for aws_default_route_table to work properly.
    }
  }
}
*/

resource "aws_instance" "my-first-server" {
  ami               = "ami-04d29b6f966df1537"
  instance_type     = "t2.micro"
  key_name          = "jenkins-key"

  tags = {
    Name = "test"
  }
}