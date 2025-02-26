variable "resource_group_name" {
  description = "Name resources group"
  type        = string
}

variable "location" {
  description = "Region Azure"
  default     = "West Europe"
  type        = string
}

variable "aks_nodes" {
  description = "List of IP addresses of the AKS cluster nodes"
  type        = list(string)
}
