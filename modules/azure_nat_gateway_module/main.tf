resource "azurerm_nat_gateway" "nat_gw" {
  name                = var.nat_gw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"

 # public_ip_address = [azurerm_public_ip.public_ip.id]
}
