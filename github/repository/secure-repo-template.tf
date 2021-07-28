
# module "secure-core-go" {
#   source     = "./module-secure-repository"
#   repository = "test"
#   dismissal_restrictions = [
#     data.github_team.technology.node_id
#     ]
#   push_restrictions = [
#     data.github_team.devsecops.node_id ,
#     data.github_team.technology.node_id 

#   ]

# }
# resource "github_team_repository" "technology" {
#   repository = "test"
#   team_id    = data.github_team.technology.id
#   permission = "push"
# }
# resource "github_team_repository" "platform" {
#   repository = "test"
#   team_id    = data.github_team.devsecops.id
#   permission = "pull"
# }
# resource "github_team_repository" "devsecops" {
#   repository = "test"
#   team_id    = data.github_team.devsecops.id
#   permission = "maintain"
# }
# #update