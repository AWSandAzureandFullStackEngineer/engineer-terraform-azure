terraform {
  backend "azurerm" {
    resource_group_name  = "engineerResourceGroup"
    storage_account_name = "engineeruserstorage"
    container_name       = "userengineercontainer"
    key                  = "engineer/terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}
