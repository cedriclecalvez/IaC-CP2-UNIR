variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "nic" {
  description = "The name of the network interface"
  default     = "mynicunir"
  type        = string
}
