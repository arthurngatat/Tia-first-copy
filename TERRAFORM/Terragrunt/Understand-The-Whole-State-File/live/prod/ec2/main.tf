resource "aws_instance" "my-first-server" {
  ami               = "ami-04d29b6f966df1537"
  instance_type     = "t2.micro"
  key_name          = "jenkins-key"

  tags = {
    Name = "test"
  }
}