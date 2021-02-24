provider "aws" {
  region = "us-west-2"
}

module "vpc_networking" {
  source = "./vpc_networking"
  region = var.region
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
}