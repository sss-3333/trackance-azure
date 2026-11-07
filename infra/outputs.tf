output "app_url" {
  value = "https://${var.custom_domain}"
}

output "front_door_url" {
  value = "https://${module.front_door.endpoint_host_name}"
}

output "container_app_url" {
  value = "https://${module.container_app.fqdn}"
}