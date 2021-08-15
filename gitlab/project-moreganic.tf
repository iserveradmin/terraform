module "module-project" {
  source = "./module-project"
  name = "Moreganic Backend"
  description = "Moreganic Backend created by terraform: version Alpha"
  visibility_level = "private"
  namespace_id = local.namespace_id
}
locals {
  namespace_id = module.group-terraform.id
}