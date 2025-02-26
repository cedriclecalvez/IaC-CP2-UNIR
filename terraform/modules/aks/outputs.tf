output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "vm_public_ip" {
  value = azurerm_virtual_machine.vm.public_ip_address
}

output "aks_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
