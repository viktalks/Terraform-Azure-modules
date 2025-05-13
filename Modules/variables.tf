#Environment
variable "env"{
    description = "Environment value"
    type=string
}

#Resource group
variable "rg_location"{
default = "Central India"
type=string
}
variable "rg_name" {
  description = "The name of the resource group"
  type=string
}

#Virtual Network(V-net) and subnet
variable "virtual_network_name" {
 description = "The name of the virtual network" 
 type=string
}
variable "subnet_name" {
 description = "The name of the subnet" 
 type=string
}

#For_each function 
variable "vm_config" {
  description = "Map of VM names to their sizes"
  type        = map(string)
}
variable "source_image_map" {
  description = "Map of VM names to image reference details"
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
}



#================> Storage Account variables <========================

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}


variable "storage_account_tier" {
  description = "The tier of the storage account (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "The replication type of the storage account (LRS, GRS, etc.)"
  type        = string
  default     = "LRS"
}


variable "container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "container_access_type" {
  description = "The access level of the storage container"
  type        = string
  
}


#============================================= > Application Gateway <=======================================
variable "app_gateway_pip" {
  description = "The name of Frontend(Public) IP of Application Gateway"
  type = string
}
variable "app_gateway_name" {
  description = "The name of the Application Gateway"
  type = string
}
variable "app_gateway_sku_name" {
  description = "The SKU name of the application Gateway"
  type = string
}
variable "app_gateway_sku_tier" {
  description = "The SKU tier of the application Gateway"
  type = string
}

#============================================= > WAF <======================================

variable "waf_name" {
  description = "The name of the WAF"
  type        = string
}

variable "blocked_ip" {
  description = "The list of IP addresses to block"
  type        = list(string)
}

variable "waf_mode" {
  description = "WAF mode - either 'Detection' or 'Prevention'"
  type        = string
 
}

variable "data_disk_replication_type" {
 description = "Define whether Standard_LRS,ZRS,GRS...."
 type = string
}
variable "data_disk_size" {
  description = "Deine the size of data disk ikn GB"
  type = number
}
variable "datadisk_name" {
  description = "The name of the Data disk"
  type = string
}