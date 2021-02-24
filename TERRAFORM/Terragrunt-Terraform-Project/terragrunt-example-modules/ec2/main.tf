provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above
  required_version = "= 0.12.20"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE ASG
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_autoscaling_group" "autoscaling" {
  launch_configuration = aws_launch_configuration.launch_configuration.id
  availability_zones   = data.aws_availability_zones.all.names
  vpc_zone_identifier  = split(",", data.aws_ssm_parameter.private_subnet.value)
  load_balancers       = [aws_elb.balancer.name]
  health_check_type    = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}

data "aws_availability_zones" "all" {}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE LAUNCH CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_launch_configuration" "launch_configuration" {
  image_id        = data.aws_ami.ami.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.asg.id]
  key_name        = var.key


  user_data = <<-EOF
              #!/bin/bash
              sudo su
              yum -y update
              yum install -y httpd mariadb-server
              amazon-linux-extras install -y php7.2 lamp-mariadb10.2-php7.2
              cd /tmp
              wget https://www.wordpress.org/latest.tar.gz &>/dev/null
              tar xzvf /tmp/latest.tar.gz --strip 1 -C /var/www/html &>/dev/null
              rm /tmp/latest.tar.gz
              chown -R apache:apache /var/www/html
              systemctl enable httpd
              systemctl start httpd
              systemctl enable mariadb
              systemctl start mariadb
              systemctl restart httpd
              cd /var/www/html
              cp -p wp-config-sample.php wp-config.php
              sed -i "/DB_HOST/s/'[^']*'/'${data.aws_ssm_parameter.dbendpoint.value}'/2" wp-config.php
              sed -i "/DB_NAME/s/'[^']*'/'${data.aws_ssm_parameter.dbname.value}'/2" wp-config.php
              sed -i "/DB_USER/s/'[^']*'/'${data.aws_ssm_parameter.dbuser.value}'/2" wp-config.php
              sed -i "/DB_PASSWORD/s/'[^']*'/'${data.aws_ssm_parameter.dbpass.value}'/2" wp-config.php
             EOF

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_ami" "ami" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
}
# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP FOR THE ASG
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "asg" {
  name   = "${var.name}-asg"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}

resource "aws_security_group_rule" "asg_allow_http_inbound" {
  type                     = "ingress"
  from_port                = var.server_port
  to_port                  = var.server_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.elb.id
  security_group_id        = aws_security_group.asg.id
}

resource "aws_security_group_rule" "asg_allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.my_ip]
  security_group_id = aws_security_group.asg.id
}

resource "aws_security_group_rule" "asg_allow_rds_inbound" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = data.aws_ssm_parameter.security_group_rds.value
  security_group_id        = aws_security_group.asg.id
}

resource "aws_security_group_rule" "asg_allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [var.public_route]
  security_group_id = aws_security_group.asg.id
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN ELB TO ROUTE TRAFFIC ACROSS THE ASG
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_elb" "balancer" {
  name            = var.name
  subnets         = split(",", data.aws_ssm_parameter.public_subnet.value)
  security_groups = [aws_security_group.elb.id]

  listener {
    lb_port           = var.elb_port
    lb_protocol       = "http"
    instance_port     = var.server_port
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    interval            = 20
    target              = "HTTP:${var.server_port}/readme.html"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP FOR THE ELB
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "elb" {
  name   = "${var.name}-elb"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}

resource "aws_security_group_rule" "elb_allow_http_inbound" {
  type              = "ingress"
  from_port         = var.elb_port
  to_port           = var.elb_port
  protocol          = "tcp"
  cidr_blocks       = [var.public_route]
  security_group_id = aws_security_group.elb.id
}

resource "aws_security_group_rule" "elb_allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [var.public_route]
  security_group_id = aws_security_group.elb.id
}
