resource "azurerm_public_ip" "jinwoo-vm-pub" {
  name                = "jinwoo-vm-pub"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  location            = azurerm_resource_group.jinwoo-rg.location
  allocation_method   = "Static"
}

output "vm-pubip" {
  value = azurerm_public_ip.jinwoo-vm-pub.id
}
