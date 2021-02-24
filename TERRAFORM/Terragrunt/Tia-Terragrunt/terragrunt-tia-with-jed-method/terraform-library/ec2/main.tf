resource "aws_instance" "my-first-server" {
  ami               = "ami-0be2609ba883822ec"
  instance_type     = "t2.micro"
  key_name          = "jenkins-key"

  tags = merge(map("Name", format("%s-bastion", local.tags["environment"])), local.tags)
}

locals {
  tags = merge(var._tag_defaults, var.tags)
}
