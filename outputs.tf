# ------------------------------
# Outputs for DEV environment
# ------------------------------
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.infra.resource_group_name
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = module.infra.virtual_network_name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = module.infra.subnet_name
}

output "vm_details" {
  description = "VM details (name, public IP, private IP)"
  value       = module.infra.vm_details
}

#=================== > Storage Account <==================
output "storage_account_name" {
  value = module.infra.storage_account_name
}
output "storage_container_name" {
  value = module.infra.storage_container_name
}

#=================== > Application Gateway <==================
output "application_gateway_configurations" {
  value = module.infra.application_gateway_configurations
}
output "waf_details" {
  value       = module.infra.waf_configuration
  description = "WAF name and mode from infra module"
}

# ==================================> Output: Data Disk Details <=================================

output "datadisk_details" {
  description = "Details of the managed data disk from module"
  value       = module.infra.datadisk_details
}



