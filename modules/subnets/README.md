# Terraform Subnets module

This module is a part of 'terraform-google-network' module. It creates Subnets for a VPC 

## Usage

Basic usage of this submodule is as follows:

```hcl
module "subnets" {
    source       = "github.com/ajgouda/terraform-google-network//modules/subnets?ref=main"

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
        }
    ]
}
```
