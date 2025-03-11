# Create dynamic inventory file for Ansible
resource "local_file" "ansible_inventory" {
  depends_on = [
    azurerm_linux_virtual_machine.vm,
    azurerm_container_registry.acr,
    azurerm_kubernetes_cluster.aks
  ]
  content = templatefile("inventory_hosts_dynamic.tmpl",
    {
      vm_public_ip_address = azurerm_linux_virtual_machine.vm.vm_ip_address
      vm_user              = azurerm_linux_virtual_machine.vm.admin_username
      aks_cluster_name     = azurerm_kubernetes_cluster.aks.name
    }
  )
  filename = "inventory_hosts_dynamic"
}

# Create dynamic all_group_vars_secrets file for Ansible
resource "local_file" "ansible_all_group_vars_secrets" {
  depends_on = [
    azurerm_linux_virtual_machine.vm,
    azurerm_container_registry.acr,
    azurerm_kubernetes_cluster.aks
  ]
  content = templatefile("inventory_vars_dynamic.tmpl",
    {
      vm_public_ip_address = azurerm_linux_virtual_machine.vm.vm_ip_address
      acr_login_server     = azurerm_container_registry.acr.login_server
      acr_username         = azurerm_container_registry.acr.admin_username
      acr_password         = azurerm_container_registry.acr.admin_password
      acr_username         = azurerm_container_registry.acr.admin_username
      aks_cluster_name     = azurerm_kubernetes_cluster.aks.name
      aks_kube_config      = azurerm_kubernetes_cluster.aks.kube_config_raw
    }
  )
  filename = "inventory_vars_dynamic.yml"
}
