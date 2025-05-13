resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = "${var.rg_name}-${var.env}"
}

# Create virtual network
resource "azurerm_virtual_network" "virtual_network_name" {
  name                = "${var.virtual_network_name}-${var.env}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "subnet_name" {
  name                 = "${var.subnet_name}-${var.subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_name.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [azurerm_virtual_network.virtual_network_name]
}