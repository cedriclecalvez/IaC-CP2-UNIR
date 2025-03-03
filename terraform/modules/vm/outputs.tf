output "private_key" {
  description = "The private key for the VM"
  value       = tls_private_key.vm_ssh.private_key_pem
  sensitive   = true
}
output "public_key" {
  description = "The public key for the VM"
  value       = tls_private_key.vm_ssh.public_key_openssh
  sensitive   = true
}

output "vm_ids" {
  description = "The IDs of the VMs"
  value       = [azurerm_linux_virtual_machine.vm.id]
}

output "vm_principal_id" {
  description = "The principal ID of the VM"
  value       = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}
output "vm_public_ip_addresses" {
  description = "The public IP addresses of the VM"
  value       = azurerm_linux_virtual_machine.vm.public_ip_addresses
}
