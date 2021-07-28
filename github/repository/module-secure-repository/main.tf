resource "github_branch" "branch-developer" {
  source_branch = "master"
  repository    = data.github_repository.each-repo.name
  branch        = "develop"
}


# #####################################################################################
resource "github_branch_default" "default-developer" {
  depends_on = [
    github_branch.branch-developer
  ]
  repository = data.github_repository.each-repo.name
  branch     = "develop"

}
#####################################################################################


# #####################################################################################
resource "github_branch_protection" "secure_master" {

  repository_id = data.github_repository.each-repo.node_id
  pattern          = "master"
  enforce_admins   = true
  allows_deletions = false

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    dismissal_restrictions = [
      
    ]
  }

  push_restrictions = [
    
  ]

}
# # #####################################################################################

# #####################################################################################
resource "github_branch_protection" "secure_develop" {

  repository_id = data.github_repository.each-repo.node_id
  # also accepts repository name
  # repository_id  = github_repository.example.name
  #for_each = github_branch.all_branch


  pattern          = "develop"
  enforce_admins   = true
  allows_deletions = false

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    dismissal_restrictions = var.dismissal_restrictions
  }

  push_restrictions = var.push_restrictions

}

# # #####################################################################################
