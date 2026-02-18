variable "location" { type = string }
variable "tags" { type = map(string) }
variable "resource_group_name" { type = string }
variable "adf_name" { type = string }
variable "managed_vnet" { type = bool }
variable "key_vault_id" { type = string }
variable "storage_account_id" { type = string }
