# storage-account-diagnostics

Attaches account-level diagnostic settings (metrics only) to an existing 
Azure Storage Account.

## Important gotcha

Storage Account log categories (StorageRead, StorageWrite, StorageDelete) 
are **not** available at the account level — they must be configured per 
sub-resource (blob, queue, table, file). This module only covers 
account-level metrics. Pair it with per-service diagnostic settings if 
full audit logging is required — this is one of the most common mistakes 
when backporting compliance logging into legacy Storage Accounts.

## Usage

```hcl
module "storage_diagnostics" {
  source                     = "./modules/storage-account-diagnostics"
  storage_account_id         = azurerm_storage_account.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
}
```
