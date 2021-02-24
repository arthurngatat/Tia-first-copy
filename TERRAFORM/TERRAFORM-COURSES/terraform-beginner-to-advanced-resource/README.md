
## Terraform for AWS
* [Download terraform](https://www.terraform.io/downloads.html)
* [AWS CLI download](https://aws.amazon.com/cli/)
* [An Introduction to Terraform](https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180)
* [Terrafom Documentation for AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

#--------------------------------------------------------------------------------------

* [Document - Code Repository](https://github.com/zealvora/terraform-beginner-to-advanced-resource)

* [Note Domain 1: Deploying Infrastructure with Terraform](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+Terraform+D1+-+Google+Docs.pdf)

* [Note Domain 2: Read, Generate, Modify Configurations](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+D2+Terraform+-+Google+Docs.pdf)

* [Note Domain 3: Terraform Provisioners](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+Terraform+D3+-+Google+Docs.pdf)

* [Note Domain 4: Terraform Modules & Workspaces](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+Terraform+D4+-+Google+Docs.pdf)

* [Note Domain 5: Remote State Management](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+Terraform+D5+-+Google+Docs.pdf)

* [Note Domain 6: Security Primer](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+Terraform+D6+-+Google+Docs.pdf)

* [Note Domain 7: Terraform Cloud & Enterprise Capabilities](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+Terraform+D7+-+Google+Docs.pdf)

* [Important Pointers for Exams](https://certifacations-tia.s3.amazonaws.com/terraform/KPLABS+Course+-+Terraform+Imp+Pointers+Exams+-+Google+Docs.pdf)



```tf
Example 1
===============================
Maps are a way to create variables that are lookup tables. An example will show this best. Let's extract our AMIs into a map and add support for the us-west-2 region as well:

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}

A variable can have a map type assigned explicitly, or it can be implicitly declared as a map by specifying a default value that is a map. The above demonstrates both.

Then, replace the aws_instance with the following:
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}

Example 2
===============================
variable "plans" {
    type = "map"
    default = {
        "5USD"  = "1xCPU-1GB"
        "10USD" = "1xCPU-2GB"
        "20USD" = "2xCPU-4GB"
    }
}
plan = "${var.plans["5USD"]}"

The values matching to their keys can also be used to look up information in other maps. For example, underneath is a short list of plans and their corresponding storage sizes.
variable "storage_sizes" {
    type = "map"
    default = {
        "1xCPU-1GB"  = "25"
        "1xCPU-2GB"  = "50"
        "2xCPU-4GB"  = "80"
    }
}
These can then be used to find the right storage size based on the monthly price as defined in the previous example.

size = "${lookup(var.storage_sizes, var.plans["5USD"])}"

variable "set_password" {
    default = false
}

Example 3
===============================
# Use Case of for_each

variable "account_name" {
   type = "map"
  default = {
      "account1" = "devops1"
      "account2" = "devops2"
      "account3" = "devops3"
}
}
resource "aws_iam_user" "iamuser" {
  for_each = var.account_name
  name = "${each.value}-iam"
}


# Use Case of for_each

variable "account_name" {
   type = map
  default = {
      "account1" = "devops1"
      "account2" = "devops2"
      "account3" = "devops3"
}
}
resource "aws_iam_user" "iamuser" {
  for_each = var.account_name
  name = "${each.value}-iam"
}


variable "account_name" {
   type = map
  default = {
      "account1" = "Admin"
      "account2" = "Jhon"
      "account3" = "Tom"
      "account5" = "Paul"
}

}
resource "aws_iam_user" "iamuser" {
  for_each = var.account_name
  name = "${each.value}"
}
```



