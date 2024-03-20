# terraform-github-repository

Terraform module to bootstrap Flux with GitHub.

## How to use this module with Terragrunt

```hcl
terraform {
  source = "tfr:///yivolve/github/flux?version=<tag version>"
}

<optional terragrunt's configuration goes here>

inputs = {
  path                   = <path    >
  ...rest of the inputs go here
}

```

### Provider Configuration

Ideally you would have the configuration below on a file that can be passed to multiple terragrunt child files:

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
        github = {
          source  = "fluxcd/flux"
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

And then the terragrunt project that calls this module would have this:

```hcl
generate "flux-configuration" {
  path      = "flux-configuration.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    provider "kubernetes" {
        host                   = data.aws_eks_cluster.eks.endpoint
        cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
        token                  = data.aws_eks_cluster_auth.eks.token
    }

    provider "flux" {
      kubernetes = {
        host                   = data.aws_eks_cluster.eks.endpoint
        cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
        token                  = data.aws_eks_cluster_auth.eks.token
      }
      git = {
        url = "ssh://git@github.com/<github org>/<repo name>.git"
        ssh = {
          username    = "git"
          private_key = jsondecode(data.aws_secretsmanager_secret_version.pem_string.secret_string)
        }
      }
    }
EOF
}
```
