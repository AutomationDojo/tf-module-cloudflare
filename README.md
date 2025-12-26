# Cloudflare Terraform Module

Comprehensive Terraform module for managing Cloudflare resources with modular submodules.

## Features

- 📄 **Pages** - Cloudflare Pages projects management
- 🌐 **DNS** - DNS records management
- 📧 **Email Routing** - Email forwarding and routing rules
- 🔄 **Automated Versioning** - Semantic release integration
- 📝 **Auto-generated Docs** - Terraform-docs integration

## Submodules

- **[pages](./modules/pages/)** - Cloudflare Pages projects
- **[dns](./modules/dns/)** - DNS records management
- **[email](./modules/email/)** - Email routing and forwarding

## Quick Start

### Pages Module

```hcl
module "pages" {
  source = "git::git@github.com:AutomationDojo/tf-module-cloudflare.git//modules/pages?ref=v1.0.0"

  account_id = var.cloudflare_account_id

  projects = {
    my-site = {
      name              = "my-site"
      production_branch = "main"
      github_repo       = "my-repo"
      build_command     = "npm run build"
      destination_dir   = "dist"
      custom_domain     = "example.com"
    }
  }
}
```

### DNS Module

```hcl
module "dns" {
  source = "git::git@github.com:AutomationDojo/tf-module-cloudflare.git//modules/dns?ref=v1.0.0"

  zone_id = var.cloudflare_zone_id

  records = [
    {
      name    = "www"
      type    = "CNAME"
      value   = "example.com"
      ttl     = 1
      proxied = true
    }
  ]
}
```

### Email Routing Module

```hcl
module "email" {
  source = "git::git@github.com:AutomationDojo/tf-module-cloudflare.git//modules/email?ref=v1.0.0"

  zone_id    = var.cloudflare_zone_id
  account_id = var.cloudflare_account_id

  email_routing = {
    enabled = true
    addresses = [
      {
        email = "admin@example.com"
      }
    ]
    rules = [
      {
        name     = "Forward contact emails"
        enabled  = true
        priority = 0
        matchers = [
          {
            type  = "literal"
            field = "to"
            value = "contact@yourdomain.com"
          }
        ]
        actions = [
          {
            type  = "forward"
            value = ["admin@example.com"]
          }
        ]
      }
    ]
  }
}
```

## Examples

See [examples](./examples/) directory for complete usage examples.

## Requirements

- Terraform >= 1.0
- Cloudflare Provider ~> 4.0

## License

MIT
