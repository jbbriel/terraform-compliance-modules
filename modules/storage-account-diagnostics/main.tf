# Note: Storage Accounts require diagnostic settings on each sub-resource
# (blob, queue, table, file) individually — the account-level resource ID
# only supports metrics, not logs. This module handles the account-level
# metrics; use storage-account-diagnostics/blob (or similar) for per-service
# log categories if needed.

resource "azurerm_monitor_diagnostic_setting" "storage_account" {
  name                           = var.diagnostic_setting_name
  target_resource_id             = var.storage_account_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  eventhub_authorization_rule_id = var.eventhub_namespace_authorization_rule_id
  eventhub_name                  = var.eventhub_name

  dynamic "metric" {
    for_each = var.metric_categories
    content {
      category = metric.value
      enabled  = true
    }
  }
}
