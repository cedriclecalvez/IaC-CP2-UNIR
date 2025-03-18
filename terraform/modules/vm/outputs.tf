
output "vm_ids" {
  description = "The IDs of the VMs"
  value       = [azurerm_linux_virtual_machine.vm_web.id]
}

output "vm_public_ip_addresses" {
  description = "The public IP addresses of the VM for SSH"
  value       = azurerm_linux_virtual_machine.vm_web.public_ip_addresses
}
output "admin_username" {
  description = "The admin username for the VM"
  value       = azurerm_linux_virtual_machine.vm_web.admin_username
}
