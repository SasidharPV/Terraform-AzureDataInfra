location                = "eastus"
tags                    = { env = "dev" }
resource_group_name     = "rg-data-dev"
vnet_name               = "vnet-dev"
vnet_address_space      = ["10.10.0.0/16"]
subnets = {
  databricks_private = "10.10.1.0/24"
  databricks_public  = "10.10.2.0/24"
  private_endpoints  = "10.10.3.0/24"
}
