variable "aws_region" {}

variable "environment" {}

variable "name" {}

variable "vpc_cidr" {}

variable "public_route" {}

variable "public_subnets_cidr" {
  type    = list
  default = []
}

variable "private_subnets_cidr" {
  type    = list
  default = []
}

variable "db_subnets_cidr" {
  type    = list
  default = []
}
