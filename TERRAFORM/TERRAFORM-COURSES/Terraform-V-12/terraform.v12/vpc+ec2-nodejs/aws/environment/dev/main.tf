provider "aws" {
  region = "us-east-1"
}

#####
# Vpc
#####

module "vpc" {
  source = "../../modules/aws-vpc"

  vpc-location                        = "Virginia"
  namespace                           = "cloudgeeks.ca"
  name                                = "vpc"
  stage                               = "nodejs-dev"
  map_public_ip_on_launch             = "true"
  total-nat-gateway-required          = "1"
  create_database_subnet_group        = "false"
  vpc-cidr                            = "10.20.0.0/16"
  vpc-public-subnet-cidr              = ["10.20.1.0/24","10.20.2.0/24"]
  vpc-private-subnet-cidr             = ["10.20.4.0/24","10.20.5.0/24"]
  vpc-database_subnets-cidr           = ["10.20.7.0/24", "10.20.8.0/24"]
}


module "sg1" {
  source              = "../../modules/aws-sg-cidr"
  namespace           = "cloudgeeks.ca"
  stage               = "dev"
  name                = "nodejs"
  tcp_ports           = "22,80,443,3000"
  cidrs               = ["111.119.187.3/32"]
  security_group_name = "nodejs"
  vpc_id              = module.vpc.vpc-id
}

module "sg2" {
  source                  = "../../modules/aws-sg-ref-v2"
  namespace               = "cloudgeeks.ca"
  stage                   = "dev"
  name                    = "nodejs-Ref"
  tcp_ports               = "22,80,443"
  ref_security_groups_ids = [module.sg1.aws_security_group_default,module.sg1.aws_security_group_default,module.sg1.aws_security_group_default]
  security_group_name     = "nodejs-Ref"
  vpc_id                  = module.vpc.vpc-id
}


module "nodejs-eip" {
  source = "../../modules/eip/nodejs"
  name                         = "nodejs"
  instance                     = module.ec2-nodejs.id[0]
}

module "ec2-keypair" {
  source = "../../modules/aws-ec2-keypair"
  key-name      = "nodejs"
  public-key    = file("../../modules/secrets/nodejs.pub")
}

module "ec2-nodejs" {
  source                        = "../../modules/aws-ec2"
  namespace                     = "cloudgeeks.ca"
  stage                         = "dev"
  name                          = "nodejs"
  key_name                      = "nodejs"
  instance_count                = 1
  ami                           = "ami-0fc61db8544a617ed"
  instance_type                 = "t3a.medium"
  associate_public_ip_address   = "true"
  root_volume_size              = 30
  subnet_ids                    = module.vpc.public-subnet-ids
  vpc_security_group_ids        = [module.sg1.aws_security_group_default]

}

