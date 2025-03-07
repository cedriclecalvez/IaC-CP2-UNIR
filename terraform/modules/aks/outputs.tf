output "aks_kube_config" {
  description = "The kube config for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_node_resource_group" {
  description = "The resource group of the AKS nodes"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}

