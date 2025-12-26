resource "cloudflare_record" "records" {
  for_each = { for idx, record in var.records : "${record.type}-${record.name}" => record }

  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  value   = each.value.value
  ttl     = each.value.ttl
  proxied = each.value.proxied

  lifecycle {
    create_before_destroy = true
  }
}
