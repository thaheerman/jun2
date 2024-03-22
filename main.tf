# Define the provider and version requirements
/*terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.60"
    }
  }
}*/

/*provider "azurerm" {
  features {}
}*/

#  Resource Group module
module "azure_resource_group_module" {
  source              = "./modules/azure_resource_group_module"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Network module
module "azure_vnet_module" {
  source              = "./modules/azure_vnet_module"
  resource_group_name = module.azure_resource_group_module.resource_group_name
  location            = module.azure_resource_group_module.location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
}


module "azure_subnet_module" {
  source              = "./modules/azure_subnet_module"
  resource_group_name = module.azure_resource_group_module.resource_group_name
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnets             = var.subnets
  depends_on          = [module.azure_vnet_module]
}

# Security module
module "azure_nsg_module" {
  source              = "./modules/azure_nsg_module"
  resource_group_name = module.azure_resource_group_module.resource_group_name
  location            = module.azure_resource_group_module.location
  nsg_name            = var.nsg_name
  nsg_rules           = var.nsg_rules
}

# NAT Gateway module
module "azure_nat_gateway_module" {
  source              = "./modules/azure_nat_gateway_module"
  resource_group_name = module.azure_resource_group_module.resource_group_name
  location            = module.azure_resource_group_module.location
  # public_ip_name      = "myPublicIP"
  nat_gw_name = var.nat_gw_name
}

#Route table module

module "azure_route_table_module" {
  source = "./modules/azure_route_table_module"

  route_table_name       = var.route_table_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  route_address_prefix   = var.route_address_prefix
  next_hop_in_ip_address = var.next_hop_in_ip_address
}