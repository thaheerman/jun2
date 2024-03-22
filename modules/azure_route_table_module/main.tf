resource "azurerm_route_table" "rt" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name

  route {
    name                   = "route1"
    address_prefix         = var.route_address_prefix
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.next_hop_in_ip_address
  }
}