
variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
}
/******************************************
	VPC configuration
 *****************************************/
variable "network_name" {
  description = "The name of the network being created"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  type        = bool
  default     = false
}

variable "routing_mode" {
  description = "The network routing mode (default 'GLOBAL')"
  type        = string
  default     = "GLOBAL"
}

variable "internal_ipv6_range" {
  description = "When enabling IPv6 ULA, optionally, specify a /48 from fd20::/20 (default null)"
  type        = string
  default     = null
}


/******************************************
	Subnet configuration
 *****************************************/

variable "subnets" {
  type = list(object({
    subnet_name   = string
    subnet_ip     = string
    subnet_region = string
  }))
  description = "The list of subnets being created"
}


/******************************************
	Firewall rules
 *****************************************/

variable "ingress_rules" {
  description = "List of ingress rules. This will be ignored if variable 'rules' is non-empty"
  default     = []
  type = list(object({
    name               = string
    destination_ranges = optional(list(string), [])
    source_ranges      = optional(list(string), [])

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
  }))
}

variable "egress_rules" {
  description = "List of egress rules. This will be ignored if variable 'rules' is non-empty"
  default     = []
  type = list(object({
    name               = string
    destination_ranges = optional(list(string), [])
    source_ranges      = optional(list(string), [])

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
  }))
}
