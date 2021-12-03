resource "azurerm_virtual_machine_extension" "jinwoo-vmexte" {
  name = "jinwoo-vmexte"
  virtual_machine_id = azurerm_virtual_machine.jinwoo-vm.id
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
  {
      "script": "${filebase64("azure-user-data.sh")}"
  }
  SETTINGS
}