resource "azurerm_network_interface" "jinwoo-nif" {
  name                = "jinwoo-nif"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

  ip_configuration {
    name                          = "jinwoo-vm-conf"
    subnet_id                     = azurerm_subnet.jinwoo-subnet-02.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jinwoo-vm-pub.id
  }
}
