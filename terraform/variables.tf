variable "location" {
  description = "The Azure region to deploy resources"
  default     = "West Europe"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "my-resource-group"
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  default     = "myacr"
  type        = string
}

# variable "load_balancer_name" {
#   description = "The name of the load balancer"
#   default     = "mylb"
#   type        = string
# }

variable "vm_name" {
  description = "The name of the virtual machine"
  default     = "myvm"
  type        = string
}

variable "aks_name" {
  description = "The name of the Azure Kubernetes Service"
  default     = "myaks"
  type        = string
}
