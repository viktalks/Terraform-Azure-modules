output "vm_details" {
  description = "Each VM's name with its public and private IPs"
  value = {
    for key, vm in azurerm_windows_virtual_machine.main :
    "${key}-${var.env}" => {
      public_ip  = azurerm_public_ip.public_ip[key].ip_address
      private_ip = azurerm_network_interface.nic[key].ip_configuration[0].private_ip_address
    }
  }
}


output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.virtual_network_name.name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.subnet_name.name
}

#=================== > Storage Account Outputs <===================
output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "storage_container_name" {
  value = azurerm_storage_container.container.name
}

#=================== > Application Gateway <==================
output "application_gateway_configurations" {
  value = {
    Appplication_gateway_name        = azurerm_application_gateway.app_gateway.name
    frontend_ip = azurerm_public_ip.app_gateway_pip.ip_address
    private_ip  = azurerm_application_gateway.app_gateway.frontend_ip_configuration[0].private_ip_address
  }
}

output "waf_configuration" {
  value = {
    name = azurerm_web_application_firewall_policy.waf.name
    mode = azurerm_web_application_firewall_policy.waf.policy_settings[0].mode
  }
  description = "WAF policy configuration including name and mode"
}

# ==================================> Output: Combined Data Disk Details <=================================

output "datadisk_details" {
  description = "Combined details of the managed data disk"
  value = {
    name           = azurerm_managed_disk.data_disk.name
    size_in_gb     = azurerm_managed_disk.data_disk.disk_size_gb
    storage_type   = azurerm_managed_disk.data_disk.storage_account_type
  }
}


