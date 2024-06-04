appgw_subnet_cidr   = "10.0.2.0/24"

aks_cluster_name       = "engineer-aks-cluster"
aks_node_pool_name     = "engineerakspool"
aks_node_count         = 4
aks_vm_size            = "Standard_B1s"
aks_min_count          = 2
aks_max_count          = 6
aks_kubernetes_version = "1.22.2"

tls_enabled = true

dns_zone_name        = "engineerscentralhub.tech"
ssl_certificate_password = "theword"


resource_group_name        = "aks-resource-group"
location                   = "centralus"
vnet_name                  = "aks-vnet"
vnet_address_space         = ["10.0.0.0/16"]
subnet_name                = "aks-subnet"
subnet_address_prefix      = "10.0.1.0/24"
dns_prefix                 = "aks"