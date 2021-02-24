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


resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a"
  tags = {
	"Terraform" = "True"
  }
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = "us-east-1b"
  tags = {
	"Terraform" = "True"
  }
}

resource "aws_elb" "prod_web" {
	name            = "prod-elb"
	subnets         = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
	security_groups = [aws_security_group.prod_web.id]

	listener {
	  instance_port     = 80
	  instance_protocol = "http"
	  lb_port           = 80
	  lb_protocol       = "http"
	}

	  tags = {
	"Terraform" = "True"
  }
}


resource "aws_launch_template" "prod_web" {
  name_prefix       = "prod-web"
  image_id          = "ami-04bf6dcdc9ab498ca"
  instance_type     = "t2.micro"
  key_name          = "jenkins-key"
  
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

resource "aws_autoscaling_group" "prod_web" {
  //availability_zones  = ["us-east-1a","us-east-1b"]
  // This is the list  of subnet ID to launch resources in.
  vpc_zone_identifier = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1

  launch_template {
    id      = aws_launch_template.prod_web.id
    version = "$Latest"
  }
  tag {
    key                 = "Terraform"
    value               = "true"
    // This means assign  this key when a new instance is launch
    propagate_at_launch = true
  }
}

// this is to attach auto-scalling to ELB
resource "aws_autoscaling_attachment" "prod_web" {
  autoscaling_group_name = aws_autoscaling_group.prod_web.id
  elb                    = aws_elb.prod_web.id
}