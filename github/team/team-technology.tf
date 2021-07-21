resource "github_team" "team-technology" {
  name        = "technology"
  description = "tech devsecops discription here."
  privacy     = "closed"
  parent_team_id = data.github_team.devsecops.id
}

variable "member-technology" {
  type = set(string)
  default = [
    "iserveradmin",
    "tyagi-jatin"
  ]
  }

resource "github_team_membership" "team-technology" {
  team_id  = data.github_team.technology.id
  username = data.github_user.iserveradmin.login
  role     = "member"
}