locals {
  ingress_rules = { for x in var.ingress_rules: x.name => x}
  egress_rules = {}
}


resource "google_compute_firewall" "firewall_rules" {
  
  for_each = local.ingress_rules
  name = each.value.name
  network = var.network_name
  project = var.project_id
  


}