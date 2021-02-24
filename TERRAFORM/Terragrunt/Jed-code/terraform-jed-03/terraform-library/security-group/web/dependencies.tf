# To get the vpc ID
data "aws_vpc" "dev_vpc" {
  filter {
    name = "tag:Name"
    values = ["Dev VPC"]
  }
}



