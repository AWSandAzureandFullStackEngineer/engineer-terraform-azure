variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "dns_zone_name" {
  description = "The name of the DNS zone"
  type        = string
}

variable "record_set_name" {
  description = "The name of the DNS record set"
  type        = string
  default     = "@"
}

variable "ttl" {
  description = "The time-to-live for the DNS record"
  type        = number
  default     = 300
}

variable "public_ip_address" {
  description = "The public IP address for the A record"
  type        = string
}
