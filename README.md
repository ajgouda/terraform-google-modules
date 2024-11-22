# Terraform Network Module

This module makes it easy to set up a new VPC Network in GCP by defining your network and subnet ranges in a concise syntax.

It supports creating:

- A Google Virtual Private Network (VPC)
- Subnets within the VPC
- firewall rules

[Sub modules](./modules/) are provided for creating individual vpc, subnets, and firewall rules. See the [modules](./modules/) directory for the various sub modules usage.
- [vpc](./modules/vpc/)
- [subnet](./modules/subnets/)
- [firewall rules](./modules/firewall-rules/)


## Usage
```hcl
module "vpc" {
    source  = "github.com/ajgouda/terraform-google-network"

    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            description           = "This subnet has a description"
        }
    ]
}
```