variable "acr_name" {
  description = "Containers register name"
  default     = "myacrunir"
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

