provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-4234324fsf"
  instance_type = "t2.micro"
  key_name = data.aws_instance.ec2_data.key_name

  tags = {
    Name="my-ec2-instance"
  }
}

data "aws_instance" "ec2_data" {
  instance_id = "ami-542dgh435"
}