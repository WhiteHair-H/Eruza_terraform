resource "azurerm_virtual_machine_scale_set_extension" "jinwoo-vmss-ex" {
  name                         = "jinwoo-vmss-ex"
  virtual_machine_scale_set_id = azurerm_virtual_machine_scale_set.jinwoo-vmss.id
  publisher                    = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.0"
  auto_upgrade_minor_version   = true
#  force_update_tag             = true
  settings = jsonencode({
    "commandToExecute" : "apt-get -y update && apt-get install -y httpd && cat > 'jinwoo-vmss' /var/www/html/index.html"
    })
}

# ### Add the Webserver to the VMSS
# resource "azurerm_virtual_machine_scale_set_extension" "vmsssampleextension" {
#   name                         = "ext-vmsssample-test"
#   virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.vmsssample.id
#   publisher                    = "Microsoft.Azure.Extensions"
#   type                         = "CustomScript"
#   type_handler_version         = "2.0"
#   auto_upgrade_minor_version   = true
#   force_update_tag             = true
  
#   settings = jsonencode({
#       "commandToExecute" : "apt-get -y update && apt-get install -y apache2" 
#     })
# }
