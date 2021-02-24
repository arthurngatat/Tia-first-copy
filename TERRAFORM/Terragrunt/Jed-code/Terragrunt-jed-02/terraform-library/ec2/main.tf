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



data "aws_vpc" "dev_vpc" {
  filter {
    name = "tag:Name"
    values = ["Dev VPC"]
  }
}


data "aws_subnet" "subnet_dev_vpc_public" {
  filter {
    name   = "tag:Name"
    values = ["Dev VPC Public Subnet"] 
  }
}


terraform {
  backend "s3" {}
  required_version = ">= 0.12.26" # Required for compatibility with TF 13 style provider block
}




