module "general" {
  # Modulos na maquina
  source = "./modules/general"

  # Modulos no repositorio
  #source                   = "git@github.com:raizen-devops/terraform-modules.git//modules/general?ref=feature/VM-LINUX-add"
  rg_name                  = local.rg_name
  identity_name            = local.identity_name
  has_windows              = var.has_windows
  has_linux                = var.has_linux
  has_subnet_out           = var.has_subnet_out
  rg_vnet_name             = local.rg_vnet_name
  vnet_name                = local.vnet_name
  subnet_name              = local.subnet_name
  subnet_name_lx           = local.subnet_name_lx
  subnet_name_out          = local.subnet_name_out
  subnet_name_out_lx       = local.subnet_name_out_lx
  delegation_name_out      = local.delegation_name_out
  subnet_prefixes          = var.subnet_prefixes
  subnet_prefixes_lx       = var.subnet_prefixes_lx
  subnet_prefixes_out      = var.subnet_prefixes_out
  subnet_prefixes_out_lx   = var.subnet_prefixes_out_lx
  subnet_service_endpoints = var.subnet_service_endpoints
  nsg_name                 = local.nsg_name
  route_table_name         = local.route_table_name
  tags                     = var.tags
  # location                            = var.location
}