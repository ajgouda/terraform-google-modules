# Terraform VPC module

This module is a part of 'terraform-google-network' module. It creates a VPC 

## Usage

Basic usage of this submodule is as follows:

```hcl
module "vpc" {
    source       = "github.com/ajgouda/terraform-google-network//modules/vpc?ref=main"
    
    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"
}
```
