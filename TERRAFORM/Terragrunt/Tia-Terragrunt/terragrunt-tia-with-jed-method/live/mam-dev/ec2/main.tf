module "ec2" {
    source = "../../../terraform-library/ec2/"
    tags   = var.tags
}

variable "tags" {
  type = map(string)
}
