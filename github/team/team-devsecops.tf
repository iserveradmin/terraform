resource "github_team" "team-devsecops" {
  name        = "devsecops"
  description = "tech devsecops discription here."
  privacy     = "closed"
}

variable "member-devsecops" {
  type = set(string)
  default = [
    "iserveradmin",
    "tyagi-jatin"
  ]
  }
  
resource "github_team_membership" "team-devsecops" {
  for_each = var.member-devsecops
  team_id  = data.github_team.devsecops.id
  username = each.key
  role     = "member"
}