variable "web_nsg_name" {
  description = "nsg for web"
  default     = "mywebnsgunir"
  type        = string
}
variable "aks_nsg_name" {
  description = "nsg for aks"
  default     = "myaksnsgunir"
  type        = string
}

variable "tag_value" {
  description = "The value of the tag to be used across the project"
  default     = "CP2"
  type        = string
}
