output "firewall_rules_ingress_egress" {
  value       = google_compute_firewall.rules_ingress_egress
  description = "The created firewall ingress/egress rule resources"
}