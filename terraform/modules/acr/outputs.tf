output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_username" {
  description = "The username for the container registry"
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_password" {
  description = "The password for the container registry"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}
