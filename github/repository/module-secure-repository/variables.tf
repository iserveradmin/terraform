##Use this data source to retrieve information about a GitHub team.#####
data "github_team" "devsecops" {
  slug = "devsecops"
}
data "github_repository" "each-repo" {
  name = var.repository
}
data "github_team" "technology" {
  slug = "technology"
}

variable "push_restrictions" {
  type = list
}

variable "dismissal_restrictions" {
  type = list
}
################################################################
variable "privacy" {
  default = "closed"
}
variable "role" {
  default = "member"
}
###################################################
variable "repository" {}

#######################################