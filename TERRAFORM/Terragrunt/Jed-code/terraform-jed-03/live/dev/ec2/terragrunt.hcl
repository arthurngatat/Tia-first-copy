include {
  path = find_in_parent_folders()
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("vars.hcl"))
}

# Required for ordering blocks using apply-all, destroy-all etc
dependencies {
  paths = ["${get_terragrunt_dir()}/../vpc", "${get_terragrunt_dir()}/../security-group"]
}

inputs = local.common_vars.inputs