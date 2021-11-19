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

# resource "azurerm_mysql_virtual_network_rule" "jinwoo-db-vnet-rule" {
#   name = "jinwoo-db-vnet-rule"
#   resource_group_name = azurerm_resource_group.jinwoo-rg.name
#   server_name = azurerm_mysql_server.jinwoo-db-server.name
#   subnet_id = azurerm_subnet.jinwoo-subnet-02.id
# }

resource "azurerm_sql_firewall_rule" "jinwoo-db-firewall" {
  name                = "jinwoo-db-firewall"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  server_name         = azurerm_mysql_server.jinwoo-db-server.name
  start_ip_address    = "20.196.199.175"
  end_ip_address      = "20.196.199.175"
}
