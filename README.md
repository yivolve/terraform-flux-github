# terraform-github-repository

Terraform module to create Github repositories.

## How to use this module with Terragrunt

```hcl
terraform {
  source = "tfr:///yivolve/repository/github?version=<tag version>"
}

<optional terragrunt's configuration goes here>

inputs = {
  name                   = <name>
  ...rest of the inputs go here
}

```

### Provider Configuration

```hcl
generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    terraform {
      required_version = "<version>"
      required_providers {
        github = {
          source  = "integrations/github"
          version = "<version>"
        }
      }
    }

    variable "github_token" {
      sensitive = true
      type      = string
    }

    provider "github" {
      owner = "<github owner>"
      token = var.github_token
    }
EOF
}
```
