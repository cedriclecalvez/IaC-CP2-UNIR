variable "aks_name" {
  description = "Azure Kubernetes Service name"
  default     = "aks-unir"
  type        = string

}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "location" {
  description = "The location of the resource group"
  type        = string
}
variable "acr_id" {
  description = "The id of the Azure Container Registry"
  type        = string
}

