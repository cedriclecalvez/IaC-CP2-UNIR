variable "avset_name" {
  description = "The name of the availability set"
  default     = "avset"
  type        = string
}
variable "vm_name" {
  description = "The name of the virtual machine"
  default     = "myvm-unir"
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
variable "storage_account_uri" {
  description = "The URI of the storage account for boot diagnostics"
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
