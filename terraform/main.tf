resource "azurerm_resource_group" "rust" {
  name     = var.projectName
  location = var.location
}

# For keyvault to provide tenant id
data "azurerm_client_config" "current" {}