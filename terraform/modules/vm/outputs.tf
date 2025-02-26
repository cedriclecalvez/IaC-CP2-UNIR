output "vm_public_ip" {
  value = azurerm_virtual_machine.vm.public_ip_address
}
