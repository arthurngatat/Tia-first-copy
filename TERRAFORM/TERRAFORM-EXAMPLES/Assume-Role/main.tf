provider "aws" {
  access_key = "AKIAXXXXXXXXXXXXXXXX"
  secret_key = "123XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  region     = "us-east-1"

  assume_role {
    role_arn    = "arn:aws:iam::01234567890:role/role_in_account_b"
    session_name = "demo-sction"
  }
}