output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
output "location" {
  value = azurerm_resource_group.rg.location
}
output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}
output "acr_login_server" {
  value = module.acr.acr_login_server
}
output "aks_kube_config" {
  description = "The kube config for the AKS cluster"
  value       = module.aks.aks_kube_config
  sensitive   = true
}
output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.aks_cluster_name
  sensitive   = true
}
output "vm_public_ip_addresses" {
  description = "The public IP addresses of the VM"
  value       = module.vm.vm_public_ip_addresses
}
output "acr_username" {
  description = "The username for the container registry"
  value       = module.acr.acr_username
  sensitive   = true
}
output "acr_name" {
  description = "Containers register name"
  value       = module.acr.acr_name
}
output "acr_password" {
  description = "The password for the container registry"
  value       = module.acr.acr_password
  sensitive   = true
}
