output "records" {
  description = "Map of DNS records created"
  value = {
    for k, v in cloudflare_record.records : k => {
      id       = v.id
      hostname = v.hostname
      type     = v.type
      value    = v.value
      proxied  = v.proxied
    }
  }
}
