output "vm_public_ip" {
  value = azurerm_virtual_machine.vm.public_ip_address
}

output "private_key" {
  value     = tls_private_key.vm_ssh.private_key_pem
  sensitive = true
}

output "vm_ids" {
  description = "The IDs of the VMs"
  value       = azurerm_virtual_machine.vm.*.id
}

output "vm_private_ips" {
  description = "The private IP addresses of the VMs"
  value       = azurerm_network_interface.nic.*.private_ip_address
}
