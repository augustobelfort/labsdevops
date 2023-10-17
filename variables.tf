####################### GENERAL #######################

# variable "location" {
#   type        = string
#   default     = "eastus2"
# }

variable "app" {
  type    = string
  default = "dirlei"
}

variable "bu" {
  type    = string
  default = "devops"
}

variable "env" {
  type    = string
  default = "poc"
}

variable "has_windows" {
  type    = bool
  default = false
}

variable "has_linux" {
  type    = bool
  default = true
}

variable "tags" {
  description = "The tags to associate with your environment."
  type        = map(string)
  default = {
    Area        = "DEVOPS"
    Ambiente    = "POC" 
    Demanda     = "LAB" 
    Empresa     = "Raizen" 
    Projeto     = "teste-devops"
    # APP         = "APP"
    # APPID       = "APXXXX"
    Responsavel = "Bruno Sarti" 
    # IaC         = "Terraform"
    CC          = "teste-devops" 
  }
}

####################### NETWORK #######################

variable "has_subnet_out" {
  type    = bool
  default = false
}

variable "has_subnet_pod" {
  type    = bool
  default = false
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.3.1.128/27"]
}

variable "subnet_prefixes_out" {
  description = "The address prefix to use for the subnet_out."
  type        = list(string)
  default     = ["10.3.1.128/27"]
}

variable "subnet_prefixes_lx" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.3.1.128/27"]
}

variable "subnet_prefixes_out_lx" {
  description = "The address prefix to use for the subnet_out."
  type        = list(string)
  default     = [""]
}

# variable "subnet_prefixes_pod" {
#   description = "The address prefix to use for the subnet_pod."
#   type        = list(string)
#   default     = [""]
# }

variable "subnet_service_endpoints" {
  description = "A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []."
  type        = list(string)
  default     = ["Microsoft.Storage", "Microsoft.KeyVault"]
}

####################### APP SERVICE #######################

variable "sufix_win" {
  description = "Sufixos dos apps Windows"
  type        = list(string)
  default     = ["webapp", "api"]
}

variable "sufix_lx" {
  description = "Sufixos dos apps Linux"
  type        = list(string)
  default     = ["static", "angular"]
}

variable "sku_type" {
  description = "Type of sku"
  type        = string
  default     = "P1v2"
}

variable "sku_type_lx" {
  description = "Type of sku"
  type        = string
  default     = "S1"
}

####################### SA-FILESHARE #######################

variable "fs_storage_account_replication_type" {
  description = "Type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}

variable "bucket" {
  description = "Nome do diretório compartilhado"
  type        = list(string)
  default     = []
}

####################### FUNCTION #######################

variable "sufix_func_win" {
  type        = list(string)
  description = "Sufixo das functions Windows"
  default     = ["x", "x"]
}

variable "sufix_func_lx" {
  type        = list(string)
  description = "Sufixo das functions Linux"
  default     = ["x", "x"]
}

####################### VM #######################

variable "vm" {
  type = list(object({
    name               = string
    size               = string
    private_ip_address = string
    disk_size_os_gb    = number
  }))

  default = [
    {
      #name               = "AZRICKLX02VP"
      name               = "AZDIRLEILX01VP"
      size               = "Standard_B1ms"
      private_ip_address = "10.3.1.138"
      disk_size_os_gb    = 128
    },
  ]
}

variable "private_ip_allocation" {
  description = "Status do IP address da VM"
  type        = string
  default     = "Static"
}

variable "vm_zone" {
  description = "Zona da máquina virtual"
  type        = string
  default     = "2"
}

variable "user_default" {
  description = "Usuário inicial"
  type        = string
  default     = "raizenuser"
}

variable "admin_password" {
  description = "Password inicial da máquina"
  type        = string
  default     = "j+6#q&2WFDyp9"
}

variable "source_image" {
  description = "Imagem da máquina"
  type        = string
  default     = "/subscriptions/30eea359-9a4b-48c7-8def-3f1577554456/resourceGroups/rg_imagens-infosec_csc_prd_eus2/providers/Microsoft.Compute/galleries/GAL_IMAGENS_INFOSEC_CSC_PRD_EUS2/images/IMG-W2K16-INFOSEC-CSC"
}

variable "disk_size_md_gb" {
  description = "Size of managed disk in gb"
  type        = string
  default     = 500
}

variable "md_zones" {
  description = "Zona do managed disk"
  type        = string
  default     = "2"
}