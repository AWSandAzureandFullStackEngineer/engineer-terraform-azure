variable "subnet_name" {
  description = "The name of the subnet"
}

variable "location" {
 description = "The Azure region where the subnet should exist"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet"
}

variable "vnet_name" {
  description = "The name of the virtual network in which to create the subnet"
}

variable "subnet_address_prefix" {
  description = "The address prefix to use for the subnet"
}
