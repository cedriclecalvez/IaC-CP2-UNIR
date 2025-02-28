output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

module "vm" {
  source = "./modules/vm"
}

module "aks" {
  source = "./modules/aks"
}

output "vm_ids" {
  description = "The IDs of the VMs"
  value       = module.vm.vm_ids
}

output "vm_private_ips" {
  description = "The private IP addresses of the VMs"
  value       = module.vm.vm_private_ips
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.aks_cluster_name
}

output "aks_node_resource_group" {
  description = "The resource group of the AKS nodes"
  value       = module.aks.aks_node_resource_group
}
