resource "azurerm_monitor_diagnostic_setting" "keyvault" {
  name                           = var.diagnostic_setting_name
  target_resource_id             = var.key_vault_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  eventhub_authorization_rule_id = var.eventhub_namespace_authorization_rule_id
  eventhub_name                  = var.eventhub_name

  dynamic "enabled_log" {
    for_each = var.log_categories
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories
    content {
      category = metric.value
      enabled  = true
    }
  }
}
