## This snippet is from the Terraform Graph Video.

### GraphiViz Documentation Referred in Course:

https://graphviz.gitlab.io/download/

### graph.tf
```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}
```



### Commands Used:
```sh
terraform graph > graph.dot
yum install graphviz
cat graph.dot | dot -Tsvg > graph.svg
```

