variable "vnet_name" {
  description = "The name of the virtual network"
}

variable "vnet_address_space" {
  description = "The address space that is used the virtual network"
  type        = list(string)
}

variable "location" {
  description = "The Azure region where the virtual network should exist"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network"
}
