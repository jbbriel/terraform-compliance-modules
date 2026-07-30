terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# --- Reference existing resources (adjust to your environment) ---

data "azurerm_key_vault" "example" {
  name                = "example-keyvault"
  resource_group_name = "example-rg"
}

data "azurerm_storage_account" "example" {
  name                = "examplestorage"
  resource_group_name = "example-rg"
}

data "azurerm_log_analytics_workspace" "example" {
  name                = "example-law"
  resource_group_name = "example-rg"
}

# --- Apply diagnostic modules ---

module "keyvault_diagnostics" {
  source = "../../modules/keyvault-diagnostics"

  key_vault_id                = data.azurerm_key_vault.example.id
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.example.id
}

module "storage_diagnostics" {
  source = "../../modules/storage-account-diagnostics"

  storage_account_id          = data.azurerm_storage_account.example.id
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.example.id
}
