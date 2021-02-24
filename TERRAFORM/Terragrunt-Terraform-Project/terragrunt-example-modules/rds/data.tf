data "aws_ssm_parameter" "vpc_cidr" {
  name = "/${var.environment}/vpc_cidr"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "db_subnet" {
  name = "/${var.environment}/db-subnet"
}
