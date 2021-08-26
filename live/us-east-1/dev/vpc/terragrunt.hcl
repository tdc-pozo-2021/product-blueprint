locals {
  regional_vars = yamldecode(file(find_in_parent_folders("regional.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment.yaml")))
  global_vars = yamldecode(file(find_in_parent_folders("global.yaml")))
  region = local.regional_vars.region
  tags = local.global_vars.tags
  project = local.global_vars.project
  env = local.environment_vars.env
}


include {
  path = find_in_parent_folders()
}

terraform {
  source = "./"
}


input = {
    project_name="${local.project}-${local.env}-${local.region}"
    default_tags = local.tags
    private_subnets_config = [
        { cidr_block = "10.10.0.32/28", az = "us-east-1a" },
        { cidr_block = "10.10.0.48/28", az = "us-east-1c" }
    ]
    vpc_cidr = "10.10.0.0/16"
}