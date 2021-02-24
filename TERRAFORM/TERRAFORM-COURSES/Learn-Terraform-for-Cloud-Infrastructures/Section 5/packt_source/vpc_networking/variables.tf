variable "region" {
  default = "us-west-2"
}

variable "vpc_cidr_block" {}
variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}
variable "public_subnet_3_cidr" {}
variable "private_subnet_1_cidr" {}
variable "private_subnet_2_cidr" {}
variable "private_subnet_3_cidr" {}
variable "eip_association_address" {}
variable "ec2_keypair" {}
variable "ec2_instance_type" {}