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

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources"
  type        = string
}

