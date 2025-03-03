output "vm_nic_id" {
  description = "The ID of the network interface to attach to the VM module and security module"
  value       = azurerm_network_interface.vm_nic.id
}
output "aks_nic_id" {
  description = "The ID of the network interface to attach to security module"
  value       = azurerm_network_interface.aks_nic.id
}
