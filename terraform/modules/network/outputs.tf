output "nic_id" {
  description = "The ID of the network interface to attach to security module"
  value       = azurerm_network_interface.nic.id
}

output "vnet_id" {
  description = "The ID of the virtual network for the subnet"
  value       = azurerm_virtual_network.myvnet.id
}

output "subnet_id" {
  description = "The ID of the subnet for the virtual network"
  value       = azurerm_subnet.myvnet_subnet.id
}
output "private_ip_address" {
  description = "The private IP address of the network interface for the VM"
  value       = azurerm_network_interface.nic.private_ip_address
}
