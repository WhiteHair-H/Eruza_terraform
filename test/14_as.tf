resource "azurerm_monitor_autoscale_setting" "jinwoo-as" {
  name = "jinwoo-as"
  resource_group_name = azurerm_resource_group.jinwoo-rg.name
  location = azurerm_resource_group.jinwoo-rg.location
  target_resource_id = azurerm_virtual_machine_scale_set.jinwoo-vmss.id

  profile {
    name = "jinwoo-profile"

    capacity {
      default = 1
      minimum = 1
      maximum = 5
    }

    rule {
      metric_trigger {
        metric_name = "Percentage CPU"
        metric_resource_id = azurerm_virtual_machine_scale_set.jinwoo-vmss.id
        time_grain = "PT1M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "GreaterThan"
        threshold = 75
        metric_namespace = "microsoft.compute/virtualmachinescalesets"
      }

      scale_action {
        direction = "Increase"
        type = "ChangeCount"
        value = "1"
        cooldown = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name = "Percentage CPU"
        metric_resource_id = azurerm_virtual_machine_scale_set.jinwoo-vmss.id
        time_grain = "PT1M"
        statistic = "Average"
        time_window = "PT5M"
        time_aggregation = "Average"
        operator = "LessThan"
        threshold = 25
      }
      scale_action {
        direction = "Decrease"
        type = "ChangeCount"
        value = "1"
        cooldown = "PT1M"
      }
    }
  }
}