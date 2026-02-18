adf_name        = "adf-qa"
managed_vnet    = true
resource_group_name = "rg-adf-qa"
location            = "eastus"
tags                = { env = "qa" }
key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-kv-qa/providers/Microsoft.KeyVault/vaults/kv-qa"
storage_account_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-data-qa/providers/Microsoft.Storage/storageAccounts/adlsqa"
