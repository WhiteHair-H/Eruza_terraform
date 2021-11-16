resource "azurerm_subnet" "jinwoo-subnet-01" {
  name = "subnet01"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  virtual_network_name = azurerm_virtual_network.jinwoo-vnet.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "jinwoo-subnet-02" {
  name = "subnet02"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  virtual_network_name = azurerm_virtual_network.jinwoo-vnet.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "jinwoo-subnet-03" {
  name = "subnet03"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  virtual_network_name = azurerm_virtual_network.jinwoo-vnet.name
  address_prefixes = ["10.0.3.0/24"]
}