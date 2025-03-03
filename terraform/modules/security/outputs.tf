output "web_sec_group_id" {
  description = "The ID of the network security group for the web server"
  value       = azurerm_network_security_group.web_sec_group.id
}

output "aks_sec_group_id" {
  description = "The ID of the network security group for the AKS"
  value       = azurerm_network_security_group.aks_sec_group.id
}
