

# End team iserver-members ############################################################


resource "github_repository" "each-repo" {
  name                   = var.repository
  visibility             = var.each-repo["visibility"]
  description            = var.description
  has_issues             = var.each-repo["has_issues"]
  has_projects           = var.each-repo["has_projects"]
  has_wiki               = var.each-repo["has_wiki"]
  is_template            = var.each-repo["is_template"]
  allow_squash_merge     = var.each-repo["allow_squash_merge"]
  allow_rebase_merge     = var.each-repo["allow_rebase_merge"]
  delete_branch_on_merge = var.each-repo["delete_branch_on_merge"]
  auto_init              = var.each-repo["auto_init"]
  vulnerability_alerts   = var.each-repo["vulnerability_alerts"]

}
# ####################################################################################

resource "github_issue_label" "iserver-standard-labels" {
  for_each    = var.labels_colors
  repository  = github_repository.each-repo.name
  name        = each.key
  description = each.value.description
  color       = each.value.color
}

resource "github_issue_label" "iserver-custom-labels" {
  for_each    = var.iserver-custom-labels
  repository  = github_repository.each-repo.name
  name        = each.key
  description = each.value.description
  color       = each.value.color
}
