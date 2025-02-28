output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "vm_public_ip" {
  value = azurerm_virtual_machine.vm.public_ip_address
}

output "aks_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_node_resource_group" {
  description = "The resource group of the AKS nodes"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}
