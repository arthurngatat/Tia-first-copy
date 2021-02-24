module "ec2" {
    //source = "github.com/leonardtia1/test-module/terraform-library/ec2
    source            = "../../../terraform-library/ec2/"
    availability_zone = var.availability_zone
    ami               = var.ami
    key_name          = var.key_name
    instance_type     = var.instance_type
}

variable "ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}


variable "availability_zone" {
  type = string
}

