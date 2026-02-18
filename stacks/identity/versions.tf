terraform {
  required_version = "~> 1.9"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.51"
    }
  }
}

provider "azuread" {}
