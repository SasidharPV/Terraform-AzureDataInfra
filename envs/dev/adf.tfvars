adf_name        = "adf-dev"
managed_vnet    = true
resource_group_name = "rg-adf-dev"
location            = "eastus"
tags                = { env = "dev" }
key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-kv-dev/providers/Microsoft.KeyVault/vaults/kv-dev"
storage_account_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-data-dev/providers/Microsoft.Storage/storageAccounts/adlsdev"
