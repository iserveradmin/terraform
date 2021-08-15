terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.7.0"
    }
  }
}

provider "gitlab" {
  token = "teQ1ziq4rep9w2VoSfRh"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "IserverAdmin"
    workspaces {
      name = "gitlab"
    }
  }
}
