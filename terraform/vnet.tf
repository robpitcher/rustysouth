resource "azurerm_virtual_network" "rust" {
  name                = "vnet-${var.projectName}"
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.rust.location
  resource_group_name = azurerm_resource_group.rust.name
}

resource "azurerm_subnet" "rust" {
  name                 = "snet-internal"
  resource_group_name  = azurerm_resource_group.rust.name
  virtual_network_name = azurerm_virtual_network.rust.name
  address_prefixes     = ["10.0.0.0/28"]
}

resource "azurerm_network_security_group" "rust" {
  name                = "nsg-${var.projectName}"
  location            = azurerm_resource_group.rust.location
  resource_group_name = azurerm_resource_group.rust.name

  security_rule {
    name              = "RustTCP"
    priority          = 110
    direction         = "Inbound"
    access            = "Allow"
    protocol          = "Tcp"
    source_port_range = "*"
    destination_port_ranges = [
      "28016",
      "28082"
    ]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name              = "RustUDP"
    priority          = 105
    direction         = "Inbound"
    access            = "Allow"
    protocol          = "Udp"
    source_port_range = "*"
    destination_port_ranges = [
      "28015",
      "28017"
    ]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "rust" {
  subnet_id                 = azurerm_subnet.rust.id
  network_security_group_id = azurerm_network_security_group.rust.id
}