output "vm_nic_id" {
  description = "The ID of the network interface to attach to the VM module and security module"
  value       = azurerm_network_interface.vm_nic.id
}
output "aks_nic_id" {
  description = "The ID of the network interface to attach to security module"
  value       = azurerm_network_interface.aks_nic.id
}
output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.myvnet.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.myvnet_subnet.id
}
output "vm_private_ip_address" {
  description = "The private IP address of the VM"
  value       = azurerm_network_interface.vm_nic.private_ip_address
}
