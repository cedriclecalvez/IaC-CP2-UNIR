# Create dynamic inventory file for Ansible
resource "local_file" "ansible_inventory" {
  depends_on = [
    module.vm,
    module.acr,
    module.aks
  ]
  content = templatefile("inventory_hosts_dynamic.tmpl",
    {
      vm_public_ip_address = module.vm.vm_public_ip_addresses[0]
      vm_user              = "adminuser"
      aks_cluster_name     = module.aks.aks_cluster_name
    }
  )
  filename = "inventory_hosts_dynamic"
}

# Create dynamic all_group_vars_secrets file for Ansible
resource "local_file" "ansible_all_group_vars_secrets" {
  depends_on = [
    module.vm,
    module.acr,
    module.aks
  ]
  content = templatefile("inventory_vars_dynamic.tmpl",
    {
      vm_public_ip_address = module.vm.vm_public_ip_addresses[0]
      vm_user              = "adminuser" # Add this line
      acr_login_server     = module.acr.acr_login_server
      acr_username         = module.acr.acr_username
      acr_password         = module.acr.acr_password
      aks_cluster_name     = module.aks.aks_cluster_name
      aks_kube_config      = module.aks.aks_kube_config
    }
  )
  filename = "inventory_vars_dynamic.yml"
}
