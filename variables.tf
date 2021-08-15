variable "GITLAB_BASE_URL" {}


data "gitlab_user" "example" {
  username = "myuser"
}

