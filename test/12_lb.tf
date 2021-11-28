resource "azurerm_lb" "jinwoo-lb" {
  name                = "jinwoo-lb"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

  frontend_ip_configuration {
    name                 = "front-conf"
    public_ip_address_id = azurerm_public_ip.jinwoo-vmss-pub.id
  }
}

# resource "azurerm_lb_backend_address_pool" "jinwoo-lb-back" {
#   #resource_group_name = azurerm_resource_group.jinwoo-rg.name
#   loadbalancer_id     = azurerm_lb.jinwoo-lb.id
#   name                = "jinwoo-lb-back"
# }

# resource "azurerm_lb_probe" "jinwoo-lb-probe" {
#   resource_group_name = azurerm_resource_group.jinwoo-rg.name
#   loadbalancer_id     = azurerm_lb.jinwoo-lb.id
#   name                = "jinwoo-lb-probe"
#   protocol            = "tcp"
#   request_path        = "/"
#   port                = 80
# }

resource "azurerm_lb_rule" "jinwoo-lb-rule" {
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  loadbalancer_id     = azurerm_lb.jinwoo-lb.id
  probe_id            = azurerm_lb_probe.jinwoo-lb-probe.id
  name                = "jinwoo-lb-rule"

  backend_address_pool_id        = azurerm_lb_backend_address_pool.jinwoo-lb-back.id
  backend_port                   = 80
  frontend_port                  = 80
  frontend_ip_configuration_name = "front-conf"
  protocol                       = "Tcp"
}
