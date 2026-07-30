output "diagnostic_setting_id" {
  description = "Resource ID of the created diagnostic setting"
  value       = azurerm_monitor_diagnostic_setting.storage_account.id
}
