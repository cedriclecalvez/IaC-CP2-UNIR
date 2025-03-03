variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "web_nsg_name" {
  description = "nsg for web"
  default     = "mywebnsgunir"
  type        = string
}
variable "aks_nsg_name" {
  description = "nsg for aks"
  default     = "myaksnsgunir"
  type        = string
}

variable "tag_value" {
  description = "The value of the tag to be used across the project"
  default     = "CP2"
  type        = string
}

variable "vm_nic_id" {
  description = "ID of the network interface for the VM"
  type        = string
}

variable "aks_nic_id" {
  description = "ID of the network interface for the aks"
  type        = string
}
