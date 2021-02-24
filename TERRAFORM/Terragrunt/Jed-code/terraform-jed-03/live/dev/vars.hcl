locals {
  common = yamldecode(file("${get_parent_terragrunt_dir()}/common.yaml"))
}


inputs = {
	# Network
	  vpc_cdir         = "192.168.0.0/16"
    cdir_bloc_subnet = ["192.168.0.0/24", "192.168.1.0/24"]
    azs              = ["us-east-1a", "us-east-1b"]
    external_route   = "0.0.0.0/0"


  # EC2
    availability_zone = "us-east-1a"
    ami               = "ami-04bf6dcdc9ab498ca"
    key_name          = "jenkins-key"
    instance_type     = "t2.micro"

}
  