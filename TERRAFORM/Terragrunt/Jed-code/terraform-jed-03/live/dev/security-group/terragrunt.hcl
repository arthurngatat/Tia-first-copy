include {
  path = find_in_parent_folders()
}

# Required for ordering blocks using apply-all, destroy-all etc
dependencies {
  paths = ["${get_terragrunt_dir()}/../vpc"]
}
