module "vpc" {
    //source = "github.com/leonardtia1/test-module/terraform-library/vpc"
    source            = "../../../terraform-library/vpc/"
    vpc_cdir         = var.vpc_cdir
    cdir_bloc_subnet = var.cdir_bloc_subnet
    azs              = var.azs
    external_route   = var.external_route
    

}



variable "vpc_cdir" {
  type = string
}

variable "cdir_bloc_subnet" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "external_route" {
  type = string
}




