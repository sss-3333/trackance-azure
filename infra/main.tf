resource "azurerm_resource_group" "app" {
  name     = "rg-${var.project}-app"
  location = var.location
}

module "log_analytics" {
  source              = "./modules/log-analytics"
  name                = "log-${var.project}"
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_resource_group.app.location
}