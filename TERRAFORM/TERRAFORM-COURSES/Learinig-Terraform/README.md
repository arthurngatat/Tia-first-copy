
## Terraform Lynda

* [Advance Terraform Lynda](https://www.lynda.com/Terraform-tutorials/What-you-should-know/2823489/3129135-4.html)

* [Learning Terraform Lynda](https://www.lynda.com/Developer-tutorials/Solution-AutoScaling-group/2823070/2272640-4.html)


https://www.bogotobogo.com/DevOps/Terraform/Terraform-VPC-Subnet-ELB-RouteTable-SecurityGroup-Apache-Server-1.php

https://jee-appy.blogspot.com/2018/07/create-aws-infrastructure-with-terraform.html

https://www.youtube.com/watch?v=nfQjOf3g4ak

https://harshitdawar.medium.com/launching-a-vpc-with-public-private-subnet-nat-gateway-in-aws-using-terraform-99950c671ce9

```tf
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


resource "aws_instance" "web-server-instance" {
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

```