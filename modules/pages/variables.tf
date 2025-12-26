variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "projects" {
  description = "Map of Cloudflare Pages projects to create"
  type = map(object({
    name                       = string
    production_branch          = string
    github_repo                = string
    build_command              = string
    destination_dir            = string
    custom_domain              = optional(string)
    preview_deployment_setting = optional(string, "none")
    environment_variables      = optional(map(string), {})
  }))
}
