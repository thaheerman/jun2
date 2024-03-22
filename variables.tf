variable "location" {
  description = "The Azure region to deploy the resources"
  type        = string
}
variable "nat_gw_name" {
  description = "The name of the NAT Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "nsg_rules" {
  description = "NSG rules to create"
  type        = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "route_table_name" {
  description = "The name of the route table"
  type        = string
}

variable "route_address_prefix" {
  description = "The destination address prefix for the route"
  type        = string
}

variable "next_hop_in_ip_address" {
  description = "The next hop IP address"
  type        = string
}

variable "subnets" {
  description = "A map of subnets to create"
  type        = map(object({ address_prefixes = list(string) }))
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the VNet"
  type        = list(string)
}

