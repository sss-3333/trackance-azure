resource "azurerm_resource_group" "app" {
  name     = "rg-${var.project}-app"
  location = var.location
}