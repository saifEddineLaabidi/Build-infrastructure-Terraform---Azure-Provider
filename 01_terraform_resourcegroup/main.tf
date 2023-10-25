provider "azurerm" {
  version = ">=2.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform_resource_group_01"
  location = "westeurope"
}