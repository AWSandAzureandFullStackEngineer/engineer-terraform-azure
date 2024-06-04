variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The location of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machine instances"
  type        = string
}

variable "appgw_subnet_id" {
  description = "The subnet ID for the Application Gateway"
  type        = string
}

variable "ssl_certificate_password" {
  description = "The password for the SSL certificate"
  type        = string
  sensitive   = true
}
