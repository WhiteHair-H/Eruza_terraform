resource "azurerm_mysql_server" "jinwoo-db-server" {
  name                         = "jinwoo-db-server"
  resource_group_name          = azurerm_resource_group.jinwoo-rg.name
  location                     = azurerm_resource_group.jinwoo-rg.location
  version                      = "5.7"
  administrator_login          = "haha"
  administrator_login_password = "It12345!"
  sku_name                     = "GP_Gen5_2"
  ssl_enforcement_enabled      = false
  storage_mb                   = 5120
}

resource "azurerm_mysql_database" "jinwoo-db" {
  name                = "wordpress"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  server_name         = azurerm_mysql_server.jinwoo-db-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_firewall_rule" "jinwoo-db-firewall" {
  name                = "jinwoo-db-fire"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  server_name         = azurerm_mysql_server.jinwoo-db-server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
