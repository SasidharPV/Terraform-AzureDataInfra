adf_name        = "adf-prod"
managed_vnet    = true
resource_group_name = "rg-adf-prod"
location            = "eastus"
tags                = { env = "prod" }
key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-kv-prod/providers/Microsoft.KeyVault/vaults/kv-prod"
storage_account_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-data-prod/providers/Microsoft.Storage/storageAccounts/adlsprod"
