### create IAM account with for loop and count to create 4 EC2

```tf
iam_accounts = ["Bob", "Sally", "Mary", "Joe"]

resource "aws_iam_user" "iam-usera" {
  for_each = var.iam_accounts
  name = each.key
}
```