/******************************************
	VPC configuration
 *****************************************/
module "vpc" {
  source = "./modules/vpc"

  project_id   = "<PROJECT ID>"
  network_name = "example-vpc"
}

/******************************************
	Subnet configuration
 *****************************************/
module "subnets" {
  source = "./modules/subnets"

  project_id   = "<PROJECT ID>"
  network_name = "example-vpc"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "us-west1"
    }
  ]
}

/******************************************
	Firewall rules
 *****************************************/
module "firewall_rules" {
  source       = "./modules/firewall-rules"
  project_id   = var.project_id
  network_name = module.vpc.network_name

  rules = [{
    name               = "allow-ssh-ingress"
    description        = null
    direction          = "INGRESS"
    destination_ranges = ["10.0.0.0/8"]
    source_ranges      = ["0.0.0.0/0"]
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
  }]
}
