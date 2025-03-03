# project variables
variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "client_id" {
  description = "The client ID for the Azure Service Principal"
  type        = string
}

variable "client_secret" {
  description = "The client secret for the Azure Service Principal"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The tenant ID for Azure"
  type        = string
}

# resource group variables
variable "location" {
  description = "The Azure region to deploy resources"
  default     = "West Europe"
  type        = string
}
variable "rg_name" {
  description = "The Azure region to deploy resources"
  default     = "rg-unir"
  type        = string
}


# tag variables
variable "tag_value" {
  description = "The value of the tag to be used across the project"
  default     = "CP2"
  type        = string
}
