terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-Nikasi"
    storage_account_name = "stgpk"
    container_name       = "containerpk"
    key                  = "prod.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "177b7e12-5f03-4f63-bcd1-ed6d1d776bff"
}

resource "azurerm_resource_group" "rg_pk" {
  name     = "rg-pk"
  location = "West Europe"
}
resource "azurerm_storage_account" "stgpk13" {
  name                     = "stgpk13"
  resource_group_name      = azurerm_resource_group.rg_pk.name
  location                 = azurerm_resource_group.rg_pk.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}