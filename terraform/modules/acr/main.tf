resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = false
}

resource "azurerm_role_assignment" "vm_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = var.role_definition_name
  principal_id         = var.vm_principal_id
  # role_definition_name = var.role_definition_name
  # principal_id         = azurerm_linux_virtual_machine.vm_web.identity[0].principal_id
}
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = var.role_definition_name
  principal_id         = var.aks_principal_id
  # role_definition_name = var.role_definition_name
  # principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

