variable "avset_name" {
  description = "The name of the availability set"
  default     = "avset"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  default     = "myvm"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "Region Azure"
  default     = "West Europe"
  type        = string
}
