# version of terraform
terraform {
  required_version = ">= 1.10.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.19.0"
    }
  }
}

# provider block, create a provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
}
# resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags = {
    environment = var.tag_value
  }
}

# storage account
resource "azurerm_storage_account" "sa" {
  name                     = "unirsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = var.tag_value
  }
}

module "network" {
  source              = "./modules/network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

}

module "security" {
  source              = "./modules/security"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_nic_id           = module.network.vm_nic_id
  aks_nic_id          = module.network.aks_nic_id
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_principal_id     = module.vm.vm_principal_id
  aks_principal_id    = module.aks.aks_principal_id
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  storage_account_uri = azurerm_storage_account.sa.primary_blob_endpoint
  vm_nic_id           = module.network.vm_nic_id
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

}

