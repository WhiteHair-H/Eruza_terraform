resource "azurerm_virtual_network" "jinwoo-vnet" {
  name = "jinwoo-vnet"
  location = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  address_space = ["10.0.0.0/16"]
}