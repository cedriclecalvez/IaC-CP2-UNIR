# Description: Contains the code to create a virtual network in Azure.
resource "azurerm_virtual_network" "myvnet" {
  name                = "vnet-unir"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = {
    environment = "CP2"
  }
}
# Description: Contains the code to create a subnet in Azure.
resource "azurerm_subnet" "myvnet_subnet" {
  name                 = "subnet-unir"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
# Description: Contains the code to create a network interface in Azure.
resource "azurerm_network_interface" "nic" {
  name                = var.nic
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.myvnet_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = {
    environment = "CP2"
  }
}

# Description: Contains the code to create a public IP address in Azure.
resource "azurerm_public_ip" "public_ip" {
  name                = "vm-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    environment = "CP2"
  }
}

