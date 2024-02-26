# Configure the Netlify Provider
provider "netlify" {
  token    = "${var.netlify_token}"
  base_url = "${var.netlify_base_url}"
}

# Create a new deploy key for this specific website
resource "netlify_deploy_key" "key" {}

# Define your site
resource "netlify_site" "main" {
  name = "my-site"

  repo {
    repo_branch   = "master"
    command       = "middleman build"
    deploy_key_id = "${netlify_deploy_key.key.id}"
    dir           = "build"
    provider      = "github"
    repo_path     = "username/reponame"
  }
}