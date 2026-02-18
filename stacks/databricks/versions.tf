terraform {
  required_version = "~> 1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.113"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.53"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.51"
    }
  }
}

provider "azurerm" {
  features {}
}

# Configure via AAD SP
provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
}

provider "azuread" {}
