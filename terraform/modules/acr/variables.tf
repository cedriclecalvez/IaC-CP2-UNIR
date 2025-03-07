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
  default     = "Basic"
  type        = string
}

