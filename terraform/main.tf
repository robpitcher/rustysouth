resource "azurerm_resource_group" "rust" {
  name     = var.projectName
  location = var.location
}

resource "azurerm_management_lock" "rust_rg" {
  name       = "terraform-applied-rg-level"
  scope      = azurerm_resource_group.rust.id
  lock_level = "CanNotDelete"
  notes      = "This Resource Group had delete protection"
}