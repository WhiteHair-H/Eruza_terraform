resource "azurerm_subnet" "jinwoo-bs-subnet" {
    name = "AzureBastionSubnet"
    resource_group_name = azurerm_resource_group.jinwoo-rg.name
    virtual_network_name = azurerm_virtual_network.jinwoo-vnet.name
    address_prefixes = ["10.0.5.0/24"]
}

resource "azurerm_public_ip" "jinwoo-bs-pubip" {
  name = "jinwoo-pubip"
  location = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_bastion_host" "jinwoo-bsh" {
  name = "jinwoo-bastion"
  location = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

  ip_configuration {
    name = "bs-conf"
    subnet_id = azurerm_subnet.jinwoo-bs-subnet.id
    public_ip_address_id = azurerm_public_ip.jinwoo-bs-pubip.id
  }
}