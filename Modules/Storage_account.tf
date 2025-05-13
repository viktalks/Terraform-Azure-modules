resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}${var.env}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_account_replication_type}"

  tags = {
    environment = "${var.env}"
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "${var.container_name}-${var.env}"
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "${var.container_access_type}" 
}