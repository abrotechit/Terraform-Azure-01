variable "location" {
  description = "My Terraform first location"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  name = "myTFResourceGroup"
  type        = string
}
