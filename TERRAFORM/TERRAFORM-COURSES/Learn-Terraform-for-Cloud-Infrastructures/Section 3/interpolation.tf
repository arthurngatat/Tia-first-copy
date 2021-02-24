variable "bucket_name" {
  description = "Bucket name for S3"
}

resource "aws_s3_bucket" "variable_s3_bucket" {
  bucket = var.bucket_name == "" ? "my-s3-bucket-name" : var.bucket_name
}

locals {
  instance_name = "dev-instance"
  instance_type = "t2.micro"
}

resource "aws_instance" "my_instance" {
  ami = "545432fgb24"
  instance_type = local.instance_type

  tags = {
    Name=local.instance_name
  }
}