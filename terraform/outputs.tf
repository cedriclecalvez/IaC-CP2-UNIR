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
}

output "vm_public_ip_addresses" {
  description = "The public IP addresses of the VM"
  value       = module.vm.vm_public_ip_addresses
}

output "private_key" {
  description = "The private key for the VM"
  value       = module.vm.private_key
  sensitive   = true
}
output "public_key" {
  description = "The public key for the VM"
  value       = module.vm.public_key
  sensitive   = true
}
