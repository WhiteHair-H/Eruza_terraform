resource "azurerm_subnet_network_security_group_association" "jinwoo-nsgass-01" {
  subnet_id                 = azurerm_subnet.jinwoo-subnet-01.id
  network_security_group_id = azurerm_network_security_group.jinwoo-nsg-lb.id
}

resource "azurerm_subnet_network_security_group_association" "jinwoo-nsgass-02" {
  subnet_id                 = azurerm_subnet.jinwoo-subnet-02.id
  network_security_group_id = azurerm_network_security_group.jinwoo-nsg-web.id
}

resource "azurerm_subnet_network_security_group_association" "jinwoo-nsgass-03" {
  subnet_id                 = azurerm_subnet.jinwoo-subnet-03.id
  network_security_group_id = azurerm_network_security_group.jinwoo-nsg-was.id
}

resource "azurerm_subnet_network_security_group_association" "jinwoo-nsgass-04" {
  subnet_id                 = azurerm_subnet.jinwoo-subnet-04.id
  network_security_group_id = azurerm_network_security_group.jinwoo-nsg-db.id
}
