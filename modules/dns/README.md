# Cloudflare DNS Module

Terraform module for managing Cloudflare DNS records.

## Features

- 📝 Manage multiple DNS records
- 🔄 Support for all DNS record types (A, AAAA, CNAME, MX, TXT, etc.)
- 🌐 Proxy support for HTTP/HTTPS records
- ⚙️ Configurable TTL per record

## Usage

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
    },
    {
      name    = "@"
      type    = "A"
      value   = "192.0.2.1"
      ttl     = 1
      proxied = true
    }
  ]
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
