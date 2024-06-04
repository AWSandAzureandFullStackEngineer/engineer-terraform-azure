output "kube_config" {
  description = "The raw Kubernetes configuration for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "kube_admin_config" {
  description = "The raw Kubernetes admin configuration for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}

output "appgw_public_ip_address_id" {
  value = azurerm_public_ip.appgw_public_ip.id
}
