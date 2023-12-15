
resource "azurerm_maintenance_configuration" "rust" {
  name                = "rust-mc"
  resource_group_name = azurerm_resource_group.rust.name
  location            = azurerm_resource_group.rust.location
  scope               = "InGuestPatch"
  in_guest_user_patch_mode = "User"

  window {
    start_date_time = "2023-12-15 05:00"
    time_zone       = "Eastern Standard Time"
    duration        = "03:55"
    recur_every     = "1Day"
  }

  install_patches {
    linux {
        classifications_to_include = [
            "Critical",
            "Security"
        ]
    }
    reboot = "IfRequired"
  }
}