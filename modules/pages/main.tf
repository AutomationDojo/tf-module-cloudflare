resource "cloudflare_pages_project" "projects" {
  for_each = var.projects

  account_id        = var.account_id
  name              = each.value.name
  production_branch = each.value.production_branch

  source {
    type = "github"
    config {
      owner                         = "AutomationDojo"
      repo_name                     = each.value.github_repo
      production_branch             = each.value.production_branch
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes       = ["*"]
    }
  }

  build_config {
    build_command   = each.value.build_command
    destination_dir = each.value.destination_dir
    root_dir        = ""
  }

  deployment_configs {
    production {
      environment_variables = each.value.environment_variables
      compatibility_date    = "2024-01-01"
      compatibility_flags   = []
    }

    preview {
      environment_variables = each.value.environment_variables
      compatibility_date    = "2024-01-01"
      compatibility_flags   = []
    }
  }
}

# Custom domains (only created if custom_domain is specified)
resource "cloudflare_pages_domain" "domains" {
  for_each = {
    for k, v in var.projects : k => v
    if v.custom_domain != null
  }

  account_id   = var.account_id
  project_name = cloudflare_pages_project.projects[each.key].name
  domain       = each.value.custom_domain
}
