variable "location" { type = string }
variable "tags" { type = map(string) }
variable "resource_group_name" { type = string }
variable "workspace_name" { type = string }
variable "managed_rg_name" { type = string }
variable "vnet_id" { type = string }
variable "private_subnet_id" { type = string }
variable "public_subnet_id" { type = string }
variable "workspace_sku" { type = string }
variable "aad_admin_group_object_id" { type = string }

