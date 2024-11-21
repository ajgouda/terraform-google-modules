
locals {
  ingress_rules = { for rule in var.ingress_rules : rule.name => merge(rule, { direction = "INGRESS" }) }
  egress_rules  = { for rule in var.egress_rules : rule.name => merge(rule, { direction = "EGRESS" }) }
  rules_all     = merge(local.ingress_rules, local.egress_rules)
}


resource "google_compute_firewall" "rules_ingress_egress" {
  for_each           = local.rules_all
  name               = each.value.name
  direction          = each.value.direction
  network            = var.network_name
  project            = var.project_id
  source_ranges      = lookup(each.value, "source_ranges", null)
  destination_ranges = lookup(each.value, "destination_ranges", null)


  dynamic "allow" {
    for_each = lookup(each.value, "allow", [])
    content {
      protocol = allow.value.protocol
      ports    = lookup(allow.value, "ports", null)
    }
  }

  dynamic "deny" {
    for_each = lookup(each.value, "deny", [])
    content {
      protocol = deny.value.protocol
      ports    = lookup(deny.value, "ports", null)
    }
  }
}