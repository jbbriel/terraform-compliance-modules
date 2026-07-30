variable "storage_account_id" {
  description = "Resource ID of the Storage Account to attach diagnostics to"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace"
  type        = string
}

variable "eventhub_namespace_authorization_rule_id" {
  description = "Resource ID of the Event Hub namespace authorization rule (optional)"
  type        = string
  default     = null
}

variable "eventhub_name" {
  description = "Name of the Event Hub to send logs to (optional)"
  type        = string
  default     = null
}

variable "diagnostic_setting_name" {
  description = "Name for the diagnostic setting resource"
  type        = string
  default     = "storage-account-diagnostics"
}

variable "metric_categories" {
  description = "List of metric categories to enable"
  type        = list(string)
  default     = ["Transaction", "Capacity"]
}
