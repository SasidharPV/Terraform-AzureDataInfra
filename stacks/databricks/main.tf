resource "azurerm_resource_group" "databricks" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_databricks_workspace" "this" {
  name                = var.workspace_name
  sku                 = var.workspace_sku
  resource_group_name = azurerm_resource_group.databricks.name
  location            = azurerm_resource_group.databricks.location
  managed_resource_group_name = var.managed_rg_name
  custom_parameters {
    no_public_ip        = true
    public_subnet_id    = var.public_subnet_id
    private_subnet_id   = var.private_subnet_id
    virtual_network_id  = var.vnet_id
    enable_no_public_ip = true
  }
  tags = var.tags
}

data "azuread_group" "admins" {
  object_id = var.aad_admin_group_object_id
}

resource "databricks_mws_permission_assignment" "admins" {
  depends_on   = [azurerm_databricks_workspace.this]
  workspace_id = azurerm_databricks_workspace.this.workspace_id
  principal_id = data.azuread_group.admins.object_id
  permissions  = ["ADMIN"]
}

resource "databricks_cluster_policy" "standard" {
  name       = "standard-policy"
  definition = jsonencode({
    spark_version = { type = "enum", values = ["13.3.x-scala2.12"] }
    autotermination_minutes = { type = "range", minValue = 15, maxValue = 240, defaultValue = 60 }
    node_type_id = { type = "fixed", value = "Standard_DS3_v2" }
  })
}

resource "databricks_cluster" "interactive" {
  cluster_name            = "interactive"
  spark_version           = "13.3.x-scala2.12"
  node_type_id            = "Standard_DS3_v2"
  autoscale {
    min_workers = 2
    max_workers = 4
  }
  autotermination_minutes = 60
  policy_id               = databricks_cluster_policy.standard.id
}
