output "full_name" {
  description = "A string of the form 'orgname/reponame'."
  value       = github_repository.flux_github_repo.full_name
}

output "html_url" {
  description = "URL to the repository on the web."
  value       = github_repository.flux_github_repo.html_url
}

output "ssh_clone_url" {
  description = "URL that can be provided to git clone to clone the repository via SSH."
  value       = github_repository.flux_github_repo.ssh_clone_url
}

output "http_clone_url" {
  description = "URL that can be provided to git clone to clone the repository via HTTPS."
  value       = github_repository.flux_github_repo.http_clone_url
}

output "git_clone_url" {
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol."
  value       = github_repository.flux_github_repo.git_clone_url
}

output "repo_id" {
  description = "GitHub ID for the repository"
  value       = github_repository.flux_github_repo.repo_id
}
