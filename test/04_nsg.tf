resource "azurerm_network_security_group" "jinwoo-nsg-lb" {
  name                = "jinwoo-nsg-lb"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

  security_rule {
    name                       = "http-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "jinwoo-nsg-web" {
  name                = "jinwoo-nsg-web"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

  security_rule {
    name                       = "web-http-rule"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "jinwoo-nsg-was" {
  name                = "jinwoo-nsg-was"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

  security_rule {
    name                       = "was-rule"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "jinwoo-nsg-db" {
  name                = "jinwoo-nsg-db"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

  security_rule {
    name                       = "db-rule"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}