variable "location" {
  description = "My Terraform first location"
  type        = string
  default     = "East US"
  validation {
    condition = contains(["East US", "West US", "West Europe"], var.location)
    error_message = "The location must be one of those defined"
  }
}

variable "resource_group_name" {
  default = "myTFResourceGroup"
  type        = string
description = "My terraform first rg"
}
variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {
    environment = "dev"
    team        = "IT"
  }
}
