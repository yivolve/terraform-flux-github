output "id" {
  description = "(String) The ID of this resource."
  value       = flux_bootstrap_git.this.id
}

output "repository_files" {
  description = "(Map of String) Git repository files created and managed by the provider."
  value       = flux_bootstrap_git.this.repository_files
}
