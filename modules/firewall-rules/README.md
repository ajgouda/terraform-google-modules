# Google Cloud VPC Firewall Rules

This module allows creation of custom VPC firewall rules.

## Usage

Variable `rules` details are available [here](#rules). Basic usage of this module is as follows:

```hcl
module "firewall_rules" {
  source       = "github.com/ajgouda/terraform-google-network//modules/firewall-rules"
  project_id   = var.project_id
  network_name = module.vpc.network_name

  rules = [{
    name                    = "allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    destination_ranges      = ["10.0.0.0/8"]
    source_ranges           = ["0.0.0.0/0"]
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
  }]
}
```