module "vm-lx-0disk" {
#  source                         = "git@github.com:raizen-devops/terraform-modules.git//modules/vm-lx-0disk?ref=feature/VM-LINUX-add"
  source                       = "./modules/vm-lx-0disk"
  depends_on                   = [module.general]
  rg_name                      = local.rg_name
  rg_vnet_name                 = local.rg_vnet_name
  vnet_name                    = local.vnet_name
  subnet_name_lx               = local.subnet_name_lx
  private_endpoint_sa_bkp_name = local.private_endpoint_sa_bkp_name
  storage_account_name         = local.storage_account_name
  vm                           = var.vm
  private_ip_allocation        = var.private_ip_allocation
  vm_zone                      = var.vm_zone
  user_default                 = var.user_default
  admin_password               = var.admin_password
  source_image                 = var.source_image
  # md_zones                     = var.md_zones

  tags = var.tags
}