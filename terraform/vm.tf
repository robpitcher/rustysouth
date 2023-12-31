# Create NIC
resource "azurerm_network_interface" "rust" {
  name                = "nic-${var.projectName}"
  location            = azurerm_resource_group.rust.location
  resource_group_name = azurerm_resource_group.rust.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.rust.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rust.id
  }

  enable_accelerated_networking = true
}

# Public Ip
resource "azurerm_public_ip" "rust" {
  name                = "pip-${var.projectName}"
  resource_group_name = azurerm_resource_group.rust.name
  location            = azurerm_resource_group.rust.location
  allocation_method   = "Static"
}


# Create ssh key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create VM
resource "azurerm_linux_virtual_machine" "rust" {
  name                = var.projectName
  resource_group_name = azurerm_resource_group.rust.name
  location            = azurerm_resource_group.rust.location
  size                = "Standard_E2as_v5"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.rust.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  patch_assessment_mode                                  = "AutomaticByPlatform"
  patch_mode                                             = "AutomaticByPlatform"
  provision_vm_agent                                     = true
  reboot_setting                                         = "IfRequired"
  bypass_platform_safety_checks_on_user_schedule_enabled = true
}

# Add VM to backups
resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = azurerm_resource_group.rust.name
  recovery_vault_name = azurerm_recovery_services_vault.rust.name
  source_vm_id        = azurerm_linux_virtual_machine.rust.id
  backup_policy_id    = azurerm_backup_policy_vm.rust.id
}

resource "azurerm_maintenance_assignment_virtual_machine" "rust" {
  location                     = azurerm_resource_group.rust.location
  maintenance_configuration_id = azurerm_maintenance_configuration.rust.id
  virtual_machine_id           = azurerm_linux_virtual_machine.rust.id
}