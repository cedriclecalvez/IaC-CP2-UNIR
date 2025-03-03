variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "vm_nic" {
  description = "value"
  default     = "vm-nic"
  type        = string
}
variable "aks_nic" {
  description = "value"
  default     = "aks-nic"
  type        = string
}
