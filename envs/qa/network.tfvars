location                = "eastus"
tags                    = { env = "qa" }
resource_group_name     = "rg-data-qa"
vnet_name               = "vnet-qa"
vnet_address_space      = ["10.20.0.0/16"]
subnets = {
  databricks_private = "10.20.1.0/24"
  databricks_public  = "10.20.2.0/24"
  private_endpoints  = "10.20.3.0/24"
}
