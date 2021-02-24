# To get the public Subnet ID
data "aws_subnet" "subnet_dev_vpc_public" {
  filter {
    name   = "tag:Name"
    values = ["Dev VPC Public Subnet"] 
  }
}

# To get the Webserver SG ID
data "aws_security_group" "webserver_sg" {
  filter {
    name   = "tag:Name"
    values = ["webserver-sg"] 
  }
}