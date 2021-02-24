### Terraform with AWS Assume Role
* [Terraform with AWS Assume Role](https://hackernoon.com/terraform-with-aws-assume-role-21567505ea98)


```json
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "arn:aws:iam::ACCOUNT-ID-WITHOUT-HYPHENS:role/Test*"
  }
}
```

```json
{
 “Version”: “2012–10–17”,
 “Statement”: [
 {
 “Effect”: “Allow”,
 “Action”: “sts:AssumeRole”,
 “Resource”: “arn:aws:iam::123545678:role/rolename”
 }
 ]
}
```

```tf
provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
}
```