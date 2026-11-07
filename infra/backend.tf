terraform {
  backend "azurerm" {
    resource_group_name  = "rg-trackance-bootstrap"
    storage_account_name = "trackancetfstate333"
    container_name       = "tfstate"
    key                  = "trackance.tfstate"
  }
}