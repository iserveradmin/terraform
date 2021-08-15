terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.7.0"
    }
  }
}

resource "gitlab_group_membership" "guest" {
  group_id     = var.group_id
  for_each = var.guest
  user_id      = data.each.key.id
  access_level = "guest"
}

resource "gitlab_group_membership" "reporter" {
  group_id     = var.group_id
  for_each = var.reporter
  user_id      = each.key
  access_level ="reporter"
}

resource "gitlab_group_membership" "developer" {
  group_id     = var.group_id
  for_each = var.developer
  user_id      = each.key
  access_level = "developer"
}

resource "gitlab_group_membership" "maintainer" {
  group_id     = var.group_id
  for_each = var.maintainer
  user_id      = each.key
  access_level = "maintainer"
}

resource "gitlab_group_membership" "owner" {
  group_id     = var.group_id
  for_each = var.owner
  user_id      = each.key
  access_level = "owner"
}
