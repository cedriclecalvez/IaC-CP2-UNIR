resource "azurerm_availability_set" "avset" {
  name                = var.avset_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = "adminuser"
    admin_password = "P@ssword123"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }


}

