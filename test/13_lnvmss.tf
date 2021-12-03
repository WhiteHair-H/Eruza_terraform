resource "azurerm_linux_virtual_machine_scale_set" "jinwoo-vmss" {
  name                = "jinwoo-vmss"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  location            = azurerm_resource_group.jinwoo-rg.location
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = "haha"
  admin_password      = "It12345678910!"

  #  health_probe_id = azurerm_lb_probe.jinwoo-lb-probe.id

  disable_password_authentication = false

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  network_interface {
    name    = "jwh-vmss-nif"
    primary = true

    ip_configuration {
      name                                   = "vmss_ip_conf"
      primary                                = true
      subnet_id                              = azurerm_subnet.jinwoo-subnet-01.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.jinwoo-lb-back.id]
    }
  }
}
