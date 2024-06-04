resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_application_gateway" "appgw" {
  name                = "${var.aks_name}-appgw"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 1
  }

  gateway_ip_configuration {
    name      = "appgwIpConfig"
    subnet_id = var.appgw_subnet_id
  }

  frontend_ip_configuration {
    name                 = "appgwPublicFrontendIp"
    public_ip_address_id = azurerm_public_ip.appgw_public_ip.id
  }

  frontend_port {
    name = "frontendPort"
    port = 443
  }

  ssl_certificate {
    name = "appgwSslCertificate"
    password = var.ssl_certificate_password
  }

  backend_address_pool {
    name = "backendAddressPool"
  }

  backend_http_settings {
    name                  = "backendHttpSettings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "appgwHttpListener"
    frontend_ip_configuration_name = "appgwPublicFrontendIp"
    frontend_port_name             = "frontendPort"
    ssl_certificate_name           = "appgwSslCertificate"
    protocol                       = "Https"
  }

  request_routing_rule {
    name                       = "requestRoutingRule"
    rule_type                  = "Basic"
    http_listener_name         = "appgwHttpListener"
    backend_address_pool_name  = "backendAddressPool"
    backend_http_settings_name = "backendHttpSettings"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_public_ip" "appgw_public_ip" {
  name                = "${var.aks_name}-appgw-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
