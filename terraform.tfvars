nat_gw_name         = "myNATGateway"
resource_group_name = "myResourceGroup"
location            = "East US"
nsg_name            = "myNSG"
nsg_rules = {
  ssh = {
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
route_table_name       = "example-route-table"
route_address_prefix   = "10.1.0.0/16"
next_hop_in_ip_address = "10.2.0.1"
subnets = {
  subnet1 = {
    address_prefixes = ["10.0.1.0/24"]
  },
  subnet2 = {
    address_prefixes = ["10.0.2.0/24"]
  }
}
vnet_name          = "myVNet"
vnet_address_space = ["10.0.0.0/16"]





