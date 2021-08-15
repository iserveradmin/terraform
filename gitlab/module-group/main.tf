terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.7.0"
    }
  }
}

resource "gitlab_group" "gitlab_group" {
  name        = var.name
  path        = var.path
  description = var.description
}