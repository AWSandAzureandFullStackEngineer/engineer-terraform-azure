output "dns_zone_name" {
  value = azurerm_dns_zone.dns_zone.name
}

output "a_record_name" {
  value = azurerm_dns_a_record.a_record.name
}
