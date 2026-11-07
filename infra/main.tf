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

data "azurerm_container_registry" "acr" {
  name                = "trackanceacr333"
  resource_group_name = "rg-trackance-bootstrap"
}

module "container_app" {
  source                       = "./modules/container-app"
  name                         = "ca-${var.project}"
  resource_group_name          = azurerm_resource_group.app.name
  location                     = azurerm_resource_group.app.location
  container_app_environment_id = module.container_env.id
  acr_id                       = data.azurerm_container_registry.acr.id
  acr_login_server             = data.azurerm_container_registry.acr.login_server
  image                        = "${data.azurerm_container_registry.acr.login_server}/trackance:v1"
}