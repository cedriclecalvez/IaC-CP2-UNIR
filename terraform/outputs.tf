output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.aks_cluster_name
}

output "aks_node_resource_group" {
  description = "The resource group of the AKS nodes"
  value       = module.aks.aks_node_resource_group
}
