resource "azurerm_virtual_machine_scale_set_extension" "jinwoo-vmss-ex" {
  name                         = "jinwoo-vmss-ex"
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.jinwoo-vmss.id
  publisher                    = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.0"
  auto_upgrade_minor_version   = true

  settings = <<SETTINGS
  {
      "script": "${filebase64("azure-user-data.sh")}"
  }
  SETTINGS

}
