
variable "subnets" {
  description = "A map of subnets to create"
  type        = map(object({ address_prefixes = list(string) }))
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the VNet"
  type        = list(string)
}
