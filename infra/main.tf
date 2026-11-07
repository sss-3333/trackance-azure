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

module "container_env" {
  source                     = "./modules/container-env"
  name                       = "cae-${var.project}"
  resource_group_name        = azurerm_resource_group.app.name
  location                   = azurerm_resource_group.app.location
  log_analytics_workspace_id = module.log_analytics.id
}