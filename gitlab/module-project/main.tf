terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.7.0"
    }
  }
}

resource "gitlab_project" "create_project" {
  name             = var.name
  description      = var.description
  visibility_level = var.visibility_level
}


resource "gitlab_project" "assign_group" {
  name         = gitlab_project.create_project.name
  description  = gitlab_project.create_project.description
  namespace_id = var.namespace_id
}
