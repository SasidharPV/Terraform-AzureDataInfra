resource "azurerm_resource_group" "purview" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Purview currently via azapi
resource "azapi_resource" "purview" {
  type      = "Microsoft.Purview/accounts@2021-12-01"
  name      = var.purview_account_name
  parent_id = azurerm_resource_group.purview.id
  location  = var.location

  tags = var.tags

  body = jsonencode({
    properties = {
      publicNetworkAccess = "Disabled"
    }
    sku = {
      name = "Standard"
    }
  })
}
