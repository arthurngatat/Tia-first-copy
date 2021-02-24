variable "environment" {}

variable "my_ip" {}

variable "key" {}

variable "aws_region" {}

variable "name" {}

variable "public_route" {}

variable "instance_type" {}

variable "min_size" {}

variable "max_size" {}

variable "server_port" {
  type = number
}

variable "elb_port" {
  type = number
}
