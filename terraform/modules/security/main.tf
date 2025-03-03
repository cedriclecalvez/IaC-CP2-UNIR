# security group for the web server
resource "azurerm_network_security_group" "web_sec_group" {
  name                = var.web_nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = var.tag_value
  }
}
# security group for the aks
resource "azurerm_network_security_group" "aks_sec_group" {
  name                = var.aks_nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location

  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = var.tag_value
  }
}

# associate the security group with the network interface for the web server
resource "azurerm_network_interface_security_group_association" "vm_nic_sg_association" {
  network_interface_id      = var.vm_nic_id
  network_security_group_id = azurerm_network_security_group.web_sec_group.id
}

# associate the security group with the network interface for the aks
resource "azurerm_network_interface_security_group_association" "aks_nic_sg_association" {
  network_interface_id      = var.aks_nic_id
  network_security_group_id = azurerm_network_security_group.aks_sec_group.id
}
