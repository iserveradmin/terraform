data "gitlab_user" "example" {
  username = "myuser"
}


module "module-team" {
  source     = "./module-team"
  group_id = local.group
  guest      = []
  reporter   = []
  developer  = ["nikhil", "gorakh"]
  maintainer = ["gary", "it"]
  owner      = ["gary"]
}


locals {
  group = module.group-terraform.id
}

