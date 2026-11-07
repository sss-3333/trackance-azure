resource "azurerm_user_assigned_identity" "this" {
  name                = "id-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_container_app" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.this.id]
  }
  
  template {
    container {
      name   = "trackance"
      image  = var.image
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}