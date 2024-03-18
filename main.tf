resource "github_repository" "flux_github_repo" {
  name                   = var.name
  description            = var.description
  visibility             = var.visibility
  delete_branch_on_merge = var.delete_branch_on_merge
  auto_init              = var.auto_init
  homepage_url           = var.homepage_url
  topics                 = var.topics
}
