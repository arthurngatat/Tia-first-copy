provider "aws" {
  alias = "us-west-2"
  region = "us-west-2"
}

provider "aws" {
  alias = "eu-central-1"
  region = "eu-central-1"
}

resource "aws_s3_bucket" "us_west_2_bucket" {
  provider = "aws.us-west-2"
  bucket = "bucket_name_for_us_west_2"
}

resource "aws_s3_bucket" "eu_central_1_bucket" {
  provider = "aws.eu-central-1"
  bucket = "bucket_name_for_eu_central_1"
}