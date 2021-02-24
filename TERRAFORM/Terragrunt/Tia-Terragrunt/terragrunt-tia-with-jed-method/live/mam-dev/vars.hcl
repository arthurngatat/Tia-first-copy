locals {
  common = yamldecode(file("${get_parent_terragrunt_dir()}/common.yaml"))
}

inputs = {

  # tags for all resources
    tags = {
      environment   = "${local.common.environment}"
      owner         = "norm.nadeau@tcs.com" 
      project       = "mam" 
      application   = "mam-dev" 
      t_dcl         = "2" 
      t_cost_centre = "9516.9130." 
      t_environment = "DEV"
      t_AppID       = "SVC02524232"
      terraform     =  "tree"
    }
}