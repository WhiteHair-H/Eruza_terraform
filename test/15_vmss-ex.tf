resource "azurerm_virtual_machine_scale_set_extension" "jinwoo-vmss-ex" {
    name = "jinwoo-vmss-ex"  
    virtual_machine_scale_set_id = azurerm_virtual_machine_scale_set.jinwoo-vmss.id
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomeScript"
    type_handler_version = "2.0"
    settings = <<SETTINGS
    {
        "script": "${filebase64("azure-user-data.sh")}"
    }
    SETTINGS
}