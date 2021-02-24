data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "public_subnet" {
  name = "/${var.environment}/public-subnet"
}

data "aws_ssm_parameter" "private_subnet" {
  name = "/${var.environment}/private-subnet"
}

data "aws_ssm_parameter" "security_group_rds" {
  name = "/${var.environment}/security_group_rds"
}

data "aws_ssm_parameter" "dbname" {
  name = "/${var.environment}/dbname"
}

data "aws_ssm_parameter" "dbuser" {
  name = "/${var.environment}/dbuser"
}

data "aws_ssm_parameter" "dbendpoint" {
  name = "/${var.environment}/dbendpoint"
}

data "aws_ssm_parameter" "dbpass" {
  name = "/${var.environment}/dbpass"
}
