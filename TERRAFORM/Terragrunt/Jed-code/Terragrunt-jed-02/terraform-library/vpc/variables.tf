
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


