resource "azurerm_managed_disk" "data_disk" {
  name                 = "${var.datadisk_name}"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "${var.data_disk_replication_type}" 
  create_option        = "Empty"
  disk_size_gb         = "${var.data_disk_size}"

  tags = {
    environment = "${var.env}"
  }
}