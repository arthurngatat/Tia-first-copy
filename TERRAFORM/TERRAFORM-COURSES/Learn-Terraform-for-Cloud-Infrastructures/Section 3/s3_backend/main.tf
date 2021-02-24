provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "my-remote-state-s3-bucket"
    key = "my-remote-state-key.tfstates"
    region = "us-west-2"
  }
}

resource "aws_security_group" "security_group" {
  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = -1
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name="AWS_ASG"
  }
}