provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.load_balancer.location
  aks_nodes           = module.aks.aks_nodes # Liste des IPs des nœuds AKS
}

module "vm" {
  source              = "./modules/vm"
  vm_name             = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "aks" {
  source   = "./modules/aks"
  aks_name = var.aks_name
}
