resource "azurerm_virtual_machine" "jinwoo-vm" {
  name                = "jinwoo-vm"
  location            = azurerm_resource_group.jinwoo-rg.location
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  network_interface_ids = [azurerm_network_interface.jinwoo-nif.id]
  vm_size = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  storage_os_disk {
    name              = "jinwoodisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "jinwoohost"
    admin_username = "haha"
    admin_password = "It12345!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
