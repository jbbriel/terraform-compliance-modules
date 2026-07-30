# keyvault-diagnostics

Attaches diagnostic settings (Log Analytics + optional Event Hub) to an 
existing Azure Key Vault, without modifying the Key Vault resource itself.

## Usage

```hcl
module "keyvault_diagnostics" {
  source                      = "./modules/keyvault-diagnostics"
  key_vault_id                = azurerm_key_vault.example.id
  log_analytics_workspace_id  = azurerm_log_analytics_workspace.example.id
}
```

## Why this exists

Backporting diagnostics into an existing Key Vault without disrupting live 
usage is easy to get subtly wrong — this module handles the dynamic block 
structure so log/metric categories can be added or changed without editing 
the resource block itself.
