###################### GENERAL #########################

variable "rg_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
}

variable "location" {
  type        = string
  description = "Azure location components"
  default     = "eastus2"
}

variable "tags" {
  type = map(string)
}

# variable "app" {
#   type        = string
# }

# variable "env" {
#   type        = string
# }

###################### NETWORK ###########################

variable "rg_vnet_name" {
  description = "The name of an existing resource group for vnet to be imported."
  type        = string
}

variable "vnet_name" {
  description = "Name of the vnet to create."
  type        = string
}

variable "subnet_name_lx" {
  description = "A list of public subnets inside the vNet."
  type        = string
}

# variable "subnet_prefixes" {
#   description = "The address prefix to use for the subnet."
#   type        = list(string)
# }

# variable "subnet_service_endpoints" {
#   description = "A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []."
#   type        = list(string)
#   default = ["Microsoft.Storage", "Microsoft.KeyVault"]
# }

###################### ROUTE TABLE #####################

# variable "route_table_name" {
#   description = "Name of the vnet to create."
#   type        = string
# }

############################### NSG #####################

# variable "nsg_name" {
#   description = "Name of the nsg to create."
#   type        = string
# }

######################## PEP #############################

variable "private_endpoint_sa_bkp_name" {
  type = string
}

##################### VIRTUAL MACHINE #######################

variable "vm" {
  type = list(object({
    name               = string
    size               = string
    private_ip_address = string
    disk_size_os_gb    = number
    # md_name              = list(string)
    # disk = list(object({
    #   name         = string
    #   disk_size_gb = number
    #   lun          = number
    # }))
  }))
}

variable "vm_zone" {
  type = string
}

variable "user_default" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "source_image" {
  type = string
}

# variable "md_zones" {
#   type = string
# }

variable "private_ip_allocation" {
  type = string
}

####################### STORAGE ACCOUNT #####################

variable "storage_account_name" {
  description = "Nome do storage account VM"
  type        = string
}

variable "storage_account_replication_type" {
  description = "Type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default     = "Standard"
}