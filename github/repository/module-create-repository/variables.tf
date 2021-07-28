##Use this data source to retrieve information about a GitHub team.#####
data "github_team" "devsecops" {
  slug = "devsecops"
}
data "github_team" "technology" {
  slug = "technology"
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
variable "description" {}
variable "each-repo" {
  type = map(any)
  default = {
    "visibility"             = "public"
    "description"            = "This is default desctiption. please define new discription here."
    "has_projects"           = true
    "has_issues"             = true
    "has_wiki"               = true
    "is_template"            = false
    "allow_squash_merge"     = false
    "allow_rebase_merge"     = false
    "delete_branch_on_merge" = false
    "auto_init"              = true
    "vulnerability_alerts"   = true
  }
}
#######################################

variable "labels_colors" {
  type        = map(any)
  description = "Labels and their colors"
  default = {
    "duplicate" = {
      "description" = "This is a duplicate of something else"
      "color"       = "cfd3d7"
    }

    "discuss" = {
      "description" = "An issue that requires a discussion"
      "color"       = "F5B041"
    }

    "will not address" = {
      "description" = "We won't address this"
      "color"       = "ffffff"
    }

    "outage" = {
      "description" = "The application is out"
      "color"       = "ff0000"
    }

    "blocked" = {
      "description" = "Blocked by another issue"
      "color"       = "d73a4a"
    }

    "bug" = {
      "description" = "Something isn't working coorrectly"
      "color"       = "d73a4a"
    }

    "enhancement feature" = {
      "description" = "This will improve the application"
      "color"       = "a2eeef"
    }

    "enhancement optimization" = {
      "description" = "This will optimize the application"
      "color"       = "a2eeef"
    }

    "technical debt" = {
      "description" = "This will cause us to go slower"
      "color"       = "7057ff"
    }

    "client request" = {
      "description" = "A client requested this"
      "color"       = "87eda2"
    }

    "unplanned work" = {
      "description" = "Work we did not plan to tackle but must"
      "color"       = "9e000b"
    }

    "severity high" = {
      "description" = "5 or more days"
      "color"       = "ff0000"
    }

    "severity medium" = {
      "description" = "two to five days"
      "color"       = "ffff00"
    }

    "severity low" = {
      "description" = "about a day"
      "color"       = "00ff00"
    }

    "severity none" = {
      "description" = "Less than a few minutes"
      "color"       = "ffffff"
    }

    "severity unknown" = {
      "description" = "Unable to determine severity at this time"
      "color"       = "ededed"
    }

    "risk high" = {
      "description" = "Will introduce a lot of risk into the project"
      "color"       = "ff0000"
    }

    "risk medium" = {
      "description" = "Will introduce some risk into the project"
      "color"       = "ffff00"
    }

    "risk low" = {
      "description" = "Will introduce a little risk into the project"
      "color"       = "00ff00"
    }

    "risk none" = {
      "description" = "Will introduce no risk into the project"
      "color"       = "ffffff"
    }

    "risk unknown" = {
      "description" = "Unable to determine risk at this time"
      "color"       = "ededed"
    }

    "priority high" = {
      "description" = "Very important to our customers"
      "color"       = "ff0000"
    }

    "priority medium" = {
      "description" = "Important to our customers"
      "color"       = "ffff00"
    }

    "priority low" = {
      "description" = "Somewhat important to our customers"
      "color"       = "00ff00"
    }

    "priority unknown" = {
      "description" = "Unable to determine priority at this time"
      "color"       = "ededed"
    }

    "criticality now" = {
      "description" = "Must be done right away"
      "color"       = "ff0000"
    }

    "criticality soon" = {
      "description" = "Must be done soon"
      "color"       = "ffff00"
    }

    "criticality later" = {
      "description" = "It can be done whenever"
      "color"       = "00ff00"
    }

    "criticality unknown" = {
      "description" = "Unable to determine criticality at this time"
      "color"       = "ededed"
    }

  }
}

variable "iserver-custom-labels" {
  type        = map(any)
  description = "Labels and their colors"
  default = {
  
  }
}