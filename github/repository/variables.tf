# Make the organization configurable through variables
variable "organization" {}
variable "OAuthToken" {}


data "github_user" "iserveradmin" {
  username = "iserveradmin"
}
data "github_user" "tyagi-jatin" {
  username = "tyagi-jatin"
}



data "github_team" "devsecops" {
  slug = "devsecops"
}
data "github_team" "technology" {
  slug = "technology"
}
