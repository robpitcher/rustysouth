resource "azurerm_recovery_services_vault" "rust" {
  name                = "${var.projectName}-recovery-vault"
  location            = azurerm_resource_group.rust.location
  resource_group_name = azurerm_resource_group.rust.name
  sku                 = "Standard"
  storage_mode_type   = "LocallyRedundant"
  soft_delete_enabled = false
}

resource "azurerm_backup_policy_vm" "rust" {
  name                = "${var.projectName}-recovery-vault-policy"
  resource_group_name = azurerm_resource_group.rust.name
  recovery_vault_name = azurerm_recovery_services_vault.rust.name

  backup {
    frequency = "Daily"
    time      = "04:00"
  }
  retention_daily {
    count = 7
  }
}