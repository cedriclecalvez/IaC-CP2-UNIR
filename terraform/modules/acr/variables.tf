variable "acr_name" {
  description = "Containers register name"
  default     = "myacrunir"
  type        = string

}
variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "acr_sku" {
  description = "Nivel of services for Vm"
  default     = "Standard"
  type        = string
}
variable "role_definition_name" {
  default = "AcrPull"
  type    = string
}



variable "vm_principal_id" {
  description = "The principal ID of the vm"
  # default     = "azurerm_linux_virtual_machine.vm_web.identity[0].principal_id"
  type = string
}

variable "aks_principal_id" {
  description = "The principal ID of the aks"
  # default     = "azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id"
  type = string
}

