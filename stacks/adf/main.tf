resource "azurerm_resource_group" "adf" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_data_factory" "this" {
  name                            = var.adf_name
  location                        = azurerm_resource_group.adf.location
  resource_group_name             = azurerm_resource_group.adf.name
  public_network_enabled          = false
  managed_virtual_network_enabled = var.managed_vnet
  tags                            = var.tags
}

resource "azurerm_data_factory_linked_service_key_vault" "kv" {
  name                = "ls-keyvault"
  data_factory_id     = azurerm_data_factory.this.id
  key_vault_id        = var.key_vault_id
  integration_runtime_name = null
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "adls" {
  name                = "ls-adls"
  data_factory_id     = azurerm_data_factory.this.id
  url                 = var.storage_account_id
  key_vault_password {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.kv.name
    secret_name         = "adls-key"
  }
}
