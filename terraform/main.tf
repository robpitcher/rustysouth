resource "azurerm_resource_group" "rust" {
  name     = var.projectName
  location = var.location
}