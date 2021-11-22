resource "azurerm_public_ip" "jinwoo-vmss-pub" {
  name = "jinwoo-vmss-pub"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  location = azurerm_resource_group.jinwoo-rg.location
  allocation_method = "Static"
}

output "vmss-pubip" {
  value = azurerm_public_ip.jinwoo-vmss-pub.id
}

resource "azurerm_virtual_machine_scale_set" "jinwoo-vmss" {
  name = "jinwoo-vmss"
  location = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name

   automatic_os_upgrade = true
   upgrade_policy_mode = "Manual"

  # rolling_upgrade_policy {
  #   max_batch_instance_percent              = 20
  #   max_unhealthy_instance_percent          = 20
  #   max_unhealthy_upgraded_instance_percent = 5
  #   pause_time_between_batches              = "PT0S"
  # }
  
 health_probe_id = azurerm_lb_probe.jinwoo-lb-probe.id


  sku {
    name = "Standard_F2"
    tier = "Standard"
    capacity = 2
  }

  storage_profile_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name_prefix = "jinwoo-vmss"
    admin_username = "haha"
    admin_password = "It12345!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name = "jinwoo-vnet-profile"
    primary = true

    ip_configuration {
      name = "jinwoo-ip-conf"
      primary = true
      subnet_id = azurerm_subnet.jinwoo-subnet-02.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.jinwoo-lb-back.id]
    }
  }
}