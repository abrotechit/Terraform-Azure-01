variable "location" {
  description = "resource group location"
  type        = string
  default     = "East US"
 validation {
    condition = contains(["East US", "West US", "West Europe"], var.location)
    error_message = "The location must be one of those defined"
  }
}

variable "user_principal_name" {
  count = 1
  if(name=contains(["test"], var.user_principal_name)){
    name="test"+(count+1)
  }
  default = "null"
  type        = string
description = "My default upn"
}
variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {
    environment = "dev"
    team        = "IT"
  }
}
