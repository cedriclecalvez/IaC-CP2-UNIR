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


variable "tag_value" {
  description = "The value of the tag to be used across the project"
  default     = "CP2"
  type        = string
}
