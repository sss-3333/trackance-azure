resource "azurerm_resource_group" "bootstrap" {
  name     = "rg-trackance-bootstrap"
  location = "uksouth"
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "trackancetfstate333"
  resource_group_name             = azurerm_resource_group.bootstrap.name
  location                        = azurerm_resource_group.bootstrap.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}