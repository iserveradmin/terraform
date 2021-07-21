provider "github" {
  owner = var.organization
  token = var.OAuthToken
}

# terraform {
#   backend "s3" {
#     bucket = "terraform-bucket-tstate-file"
#     key    = "github/terraform.tfstate"
#     region = "us-east-2"
#   }
# }

