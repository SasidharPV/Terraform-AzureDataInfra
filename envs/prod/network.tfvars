location                = "eastus"
tags                    = { env = "prod" }
resource_group_name     = "rg-data-prod"
vnet_name               = "vnet-prod"
vnet_address_space      = ["10.30.0.0/16"]
subnets = {
  databricks_private = "10.30.1.0/24"
  databricks_public  = "10.30.2.0/24"
  private_endpoints  = "10.30.3.0/24"
}
