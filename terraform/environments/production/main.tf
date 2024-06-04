locals {
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "vnet_module" {
  source              = "../../modules/vnet"
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "aks_module" {
  source                   = "../../modules/aks"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  aks_name                 = var.aks_cluster_name
  dns_prefix               = var.dns_prefix
  node_count               = var.aks_node_count
  vm_size                  = var.aks_vm_size
  appgw_subnet_id          = module.subnet_module.appgw_public_ip_address_id
  ssl_certificate_password = var.ssl_certificate_password
}


module "subnet_module" {
  source                = "../../modules/subnet"
  subnet_name           = var.subnet_name
  location              = local.location
  resource_group_name   = var.resource_group_name
  vnet_name             = var.vnet_name
  subnet_address_prefix = var.subnet_address_prefix

}

module "dns_zone" {
  source              = "../../modules/dns"
  resource_group_name = local.resource_group_name
  dns_zone_name       = var.dns_zone_name
  public_ip_address   = module.subnet_module.public_ip_address_id
  record_set_name     = "@"
  ttl                 = 300
}
