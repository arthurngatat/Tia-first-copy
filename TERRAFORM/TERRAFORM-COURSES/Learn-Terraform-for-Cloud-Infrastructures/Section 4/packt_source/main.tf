provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.website_domain
  acl = "public-read"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "PublicReadAccessForWebsite",
    "Effect": "Allow",
    "Action": "s3:GetObject",
    "Principal": "*",
    "Resource": ["arn:aws:s3:::${var.website_domain}/*"]
    }
  ]
}
POLICY

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index_html" {
  bucket = var.website_domain
  key = "index.html"
  content_type = "text/html"

  source = "index.html"
}

resource "aws_s3_bucket_object" "error_html" {
  bucket = var.website_domain
  key = "error.html"
  content_type = "text/html"

  source = "error.html"
}