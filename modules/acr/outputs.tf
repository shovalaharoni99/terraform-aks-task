output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  description = "Login server for the ACR."
  value       = azurerm_container_registry.acr.login_server
}
