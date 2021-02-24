variable "region" {
  default = "us-west-2"
  description = "AWS Region"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  description = "VPC CIDR Block"
}

variable "public_subnet_cidr_block" {
  default = "10.0.1.0/24"
  description = "Public Subnet CIDR Block"
}

variable "private_subnet_cidr_block" {
  default = "10.0.2.0/24"
  description = "Private Subnet CIDR Block"
}