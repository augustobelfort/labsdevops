####################### GENERAL #######################

variable "location" {
  type    = string
  default = "eastus2"
}

variable "rg_name" {
  type = string
}

variable "identity_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "has_windows" {
  type    = bool
  default = true
}

variable "has_linux" {
  type    = bool
  default = false
}

####################### NETWORK #######################

variable "has_subnet_out" {
  type    = bool
  default = true
}

variable "rg_vnet_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_name_out" {
  type = string
}

variable "subnet_name_lx" {
  type = string
}

variable "subnet_name_out_lx" {
  type    = string
  default = ""
}

variable "subnet_name_pod" {
  type    = string
  default = ""
}

variable "has_subnet_pod" {
  type    = bool
  default = false
}

variable "delegation_name_out" {
  type = string
}

variable "subnet_prefixes" {
  type = list(string)
}

variable "subnet_prefixes_out" {
  type    = list(string)
  default = []
}

variable "subnet_prefixes_lx" {
  type = list(string)
}

variable "subnet_prefixes_out_lx" {
  type    = list(string)
  default = []
}

variable "subnet_prefixes_pod" {
  type    = list(string)
  default = []
}

variable "subnet_service_endpoints" {
  type = list(string)
}

####################### NSG #######################

variable "nsg_name" {
  type = string
}

####################### ROUTE TABLE #######################

variable "route_table_name" {
  type = string
}
