# version of terraform
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

# provider block, create a provider
provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id
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
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"
}

module "acr" {
  source = "./modules/acr"
}

module "vm" {
  source = "./modules/vm"
}

module "aks" {
  source = "./modules/aks"
}

