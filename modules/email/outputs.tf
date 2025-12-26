output "email_routing_status" {
  description = "Email routing status (managed manually or via API)"
  value       = var.email_routing.enabled
}

output "email_addresses" {
  description = "Map of email addresses created"
  value = {
    for k, v in cloudflare_email_routing_address.addresses : k => {
      id      = v.id
      email   = v.email
      tag     = v.tag
      created = v.created
    }
  }
}

output "email_rules" {
  description = "Map of email routing rules created"
  value = {
    for k, v in cloudflare_email_routing_rule.rules : k => {
      id       = v.id
      name     = v.name
      enabled  = v.enabled
      priority = v.priority
      tag      = v.tag
    }
  }
}
