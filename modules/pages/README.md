# Cloudflare Pages Module

Terraform module for creating and managing Cloudflare Pages projects with GitHub integration.

## Features

- 🚀 Creates Cloudflare Pages projects
- 🔗 Automatic GitHub integration for CI/CD
- 🌐 Custom domain support with automatic SSL/TLS
- ⚙️ Environment variables configuration
- 🔄 Production and preview deployments

## Usage

```hcl
module "pages" {
  source = "git::git@github.com:AutomationDojo/tf-module-cloudflare.git//modules/pages?ref=v1.0.0"

  account_id = var.cloudflare_account_id

  projects = {
    landing-page = {
      name              = "my-landing-page"
      production_branch = "main"
      github_repo       = "my-repo"
      build_command     = "npm run build"
      destination_dir   = "dist"
      custom_domain     = "example.com"
      environment_variables = {
        NODE_VERSION = "20"
      }
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
