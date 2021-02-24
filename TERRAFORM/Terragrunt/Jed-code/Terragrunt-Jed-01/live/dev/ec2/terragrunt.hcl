include {
  path = find_in_parent_folders()
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("vars.hcl"))
}

inputs = local.common_vars.inputs