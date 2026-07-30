# Terraform Azure Compliance Diagnostics Modules

Pre-built, production-tested Terraform modules for backporting 
diagnostic settings (Event Hub + Log Analytics) into Azure Key Vault 
and Storage Account resources — without disrupting live workloads.

## Why this exists

Adding compliant logging/diagnostics to legacy Azure infrastructure 
is tedious and easy to get subtly wrong. These modules handle the 
common gotchas (e.g. Storage Account log categories requiring 
sub-resource-level configuration, not account-level) so you don't 
have to rediscover them the hard way.

## Modules

- `keyvault-diagnostics` — Log Analytics + optional Event Hub 
  diagnostic settings for Key Vault
- `storage-account-diagnostics` — account-level metrics for Storage 
  Accounts (see module README for the sub-resource logging caveat)

## Usage

See `examples/basic-usage/main.tf` for a full working example using 
both modules together.

## License

MIT — see LICENSE.
