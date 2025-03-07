variable "location" {
  description = "The location of the resource group"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "nsg_name" {
  description = "nsg for web"
  default     = "mynsgunir"
  type        = string
}
variable "nic_id" {
  description = "ID of the network interface"
  type        = string
}
variable "tag_value" {
  description = "The value of the tag to be used across the project"
  default     = "CP2"
  type        = string
}


