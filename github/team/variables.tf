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
    depends_on = [github_team.team-devsecops]
  slug = "devsecops"
}
data "github_team" "technology" {
     depends_on = [github_team.team-technology]
  slug = "technology"
}
