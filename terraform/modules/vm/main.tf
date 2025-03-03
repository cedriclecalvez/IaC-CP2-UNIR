resource "azurerm_availability_set" "avset" {
  name                = var.avset_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "tls_private_key" "vm_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "vm_web" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = "Standard_DS1_v2"
  admin_username                  = "adminuser"
  network_interface_ids           = [var.vm_nic_id]
  availability_set_id             = azurerm_availability_set.avset.id # 🔄 Associe la VM à l'Availability Set
  disable_password_authentication = true                              # 🔄 to disable password authentication and enforce SSH key-based authentication

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.vm_ssh.public_key_openssh
  }

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    environment = var.tag_value
  }
}




