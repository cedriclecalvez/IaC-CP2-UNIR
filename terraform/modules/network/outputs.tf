output "nic_id" {
  description = "The ID of the network interface to attach to security module"
  value       = azurerm_network_interface.nic.id
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.myvnet.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.myvnet_subnet.id
}
output "private_ip_address" {
  description = "The private IP address of the network interface"
  value       = azurerm_network_interface.nic.private_ip_address
}
