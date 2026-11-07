resource "azurerm_container_app" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id
  revision_mode                = "Single"

  template {
    container {
      name   = "trackance"
      image  = var.image
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}