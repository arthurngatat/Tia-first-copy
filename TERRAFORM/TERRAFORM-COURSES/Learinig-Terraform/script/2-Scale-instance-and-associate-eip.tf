provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "prod_tf_course" {
  bucket = "tf-course-201911188"
  acl    = "private"
  tags = {
    "Terraform" : "true"
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "prod_web" {
  name        = "prod_web"
  description = "Allow standard http and https ports inbound and everything outbound"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
    "Terraform" : "true"
  }
}


resource "aws_instance" "prod_web" {
  // to launch 2 EC2 instances
  count = 2

  ami               = "ami-04bf6dcdc9ab498ca"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "jenkins-key"

  vpc_security_group_ids = [ 
    aws_security_group.prod_web.id
   ]

  user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                cd /var/www/html

                # liyeplimal website
                wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/www.liyeplimal.net.zip
                unzip www.liyeplimal.net.zip
                rm -rf www.liyeplimal.net.zip
                cp -R www.liyeplimal.net/* .
                rm -rf www.liyeplimal.net
                EOF
  tags = {
    Name = "web-server"
  }
}

resource "aws_eip_association" "prod_web" {
  // we need to specify where to bound the eip because we 2 ec2 instances now.
  // we can use the count index to choose the first instance.
  // this is because you can assign the same eip to 2 instances. 	
  instance_id   = aws_instance.prod_web[0].id
  allocation_id = aws_eip.prod_web.id
}

resource "aws_eip" "prod_web" {
  tags = {
	"Terraform" = "True"
  }
}