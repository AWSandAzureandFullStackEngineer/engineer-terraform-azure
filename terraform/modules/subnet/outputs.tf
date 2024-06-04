output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.example.id
}

output "appgw_public_ip_address_id" {
  value = azurerm_public_ip.engineerscentralhub_public_ip.id
}
output "public_ip_address_id" {
  value = azurerm_public_ip.engineerscentralhub_public_ip.id
}
