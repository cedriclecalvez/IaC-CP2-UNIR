variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "vm_nic" {
  description = "The name of the network interface for the VM module"
  default     = "vm-nic"
  type        = string
}
variable "aks_nic" {
  description = "The name of the network interface for the AKS cluster"
  default     = "aks-nic"
  type        = string
}
