output "id" { 
    value = gitlab_group.gitlab_group.id 
}
output "full_path" { 
    value = gitlab_group.gitlab_group.full_path 
}
output "web_url" { 
    value = gitlab_group.gitlab_group.web_url 
}
output "runners_token" { 
    value = gitlab_group.gitlab_group.runners_token
}
