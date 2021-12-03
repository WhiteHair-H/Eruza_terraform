resource "azurerm_public_ip" "jinwoo-vmss-pub" {
  name                = "jinwoo-vmss-pub"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  location            = azurerm_resource_group.jinwoo-rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}
output "vmss-pubip" {
  value = azurerm_public_ip.jinwoo-vmss-pub.id
}

resource "azurerm_lb" "jinwoo-lb" {
  name                = "jinwoo-lb"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "front-ip"
    public_ip_address_id = azurerm_public_ip.jinwoo-vmss-pub.id
  }
}

resource "azurerm_lb_backend_address_pool" "jinwoo-lb-back" {
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  loadbalancer_id     = azurerm_lb.jinwoo-lb.id
  name                = "jinwoo-lb-back"
}

resource "azurerm_lb_probe" "jinwoo-lb-probe" {
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  loadbalancer_id     = azurerm_lb.jinwoo-lb.id
  name                = "jinwoo-lb-probe"
  protocol            = "Http"
  request_path        = "/health.html"
  port                = 80
}

resource "azurerm_lb_rule" "jinwoo-lb-rule" {
  name                           = "jinwoo-lb-rule"
  resource_group_name            = azurerm_resource_group.jinwoo-rg.name
  loadbalancer_id                = azurerm_lb.jinwoo-lb.id
  probe_id                       = azurerm_lb_probe.jinwoo-lb-probe.id
  disable_outbound_snat          = true
  backend_address_pool_id        = azurerm_lb_backend_address_pool.jinwoo-lb-back.id
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "front-ip"
  protocol                       = "Tcp"
}


resource "azurerm_lb_outbound_rule" "jinwoo-lb-out" {
  resource_group_name      = azurerm_resource_group.jinwoo-rg.name
  loadbalancer_id          = azurerm_lb.jinwoo-lb.id
  name                     = "jinwoo-lb-out"
  protocol                 = "All"
  backend_address_pool_id  = azurerm_lb_backend_address_pool.jinwoo-lb-back.id
  allocated_outbound_ports = 1024
  frontend_ip_configuration {
    name = "front-ip"
  }
}
