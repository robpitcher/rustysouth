resource "azurerm_log_analytics_workspace" "rust" {
  name                = "${var.projectName}-law"
  location            = "eastus2"
  resource_group_name = azurerm_resource_group.rust.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}