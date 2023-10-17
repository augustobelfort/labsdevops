locals {
  ####################### GENERAL #######################
  rg_name             = upper("RG_${var.app}_${var.bu}_${var.env}_EUS2")
  identity_name       = lower("id${var.app}${var.bu}${var.env}")
  
  #rg_vnet_name        = upper("RG_NETWORK_${var.bu}_${var.env}_EUS2")
  #vnet_name           = upper("VNET_${var.bu}_${var.env}_EUS2")
  rg_vnet_name        = "dev-jeancorreia"
  vnet_name           = "dev-jeancorreia-vnet"
  
  #OBS: TIVE QUE TROCAR O RG DA ROUTE TABLE NOS MODULOS NA MÃO, PARA RG_NETWORK_ARQUITETURA_DEV_EUS2, PQ É DIFF DO RG DA VNET, E DEPOIS DESFIZ
  subnet_name         = upper("SUBNET_${var.bu}_${var.env}_EUS2_${var.app}")
  subnet_name_lx      = upper("SUBNET_${var.bu}_${var.env}_EUS2_${var.app}_LX")
  subnet_name_out     = upper("SUBNET_${var.bu}_${var.env}_EUS2_${var.app}_OUT")
  subnet_name_out_lx  = upper("SUBNET_${var.bu}_${var.env}_EUS2_${var.app}_OUT_LX")
  subnet_name_pod     = upper("SUBNET_${var.bu}_${var.env}_EUS2_${var.app}_POD")
  delegation_name_out = upper("SUBNET_${var.app}_DELEGATION_OUT")
  nsg_name            = upper("NSG_${var.app}_${var.bu}_${var.env}_EUS2")
  #route_table_name    = upper("RT-RFC_${var.bu}_${var.env}_EUS2")
  route_table_name    = "RT-FRC_ARQUITETURA_DEV_EUS2"

  ####################### KV #######################
  key_vault_name           = lower("kv-${var.app}-${var.bu}-${var.env}")
  private_endpoint_kv_name = lower("pep-${var.app}-kv-${var.env}")

  ####################### APPSERVICE #######################
  appserviceplan_name          = upper("ASP-${var.app}${var.bu}${var.env}EUS2")
  appservice_name              = lower("app${var.app}${var.bu}${var.env}")
  private_endpoint_appsvc_name = lower("pep-${var.app}-${var.env}")

  ####################### FUNCTION #######################
  function_name                       = lower("function${var.app}${var.bu}${var.env}")
  private_endpoint_function_name      = lower("pep-${var.app}-${var.env}")
  storage_account_func_name           = lower("sa${var.app}func${var.env}")
  storage_account_func_name_container = lower("sac${var.app}func${var.env}")
  private_endpoint_blob_func_name     = lower("pep-${var.app}-blob-func-${var.env}")

  ####################### SA #######################
  private_endpoint_sa_bkp_name   = lower("pep-${var.app}-sa-bkp-${var.env}")
  storage_account_name           = lower("sa${var.app}bkp${var.env}")
  storage_account_name_container = lower("sac${var.app}bkp${var.env}")

  ####################### VM #######################

  ####################### FS #######################
  fs_storage_account_name    = lower("fs${var.app}${var.bu}${var.env}")
  blob_directory_name        = lower("blob-${var.bu}-${var.app}-${var.env}")
  private_endpoint_blob_name = lower("pep-${var.app}-blob-${var.env}")
  ####################### DF #######################
  df_name                  = lower("df-${var.app}-${var.bu}-${var.env}")
  private_endpoint_df_name = lower("pep-${var.app}-df-${var.env}")

  ####################### REDIS #######################
  private_endpoint_redis_name = lower("pep-${var.app}-${var.bu}-${var.env}")
  redis_name                  = lower("${var.app}-${var.bu}-${var.env}")

  ####################### SQLMI #######################
  sqlmi_name = lower("${var.app}-${var.bu}-${var.env}")

  # tags = {
  #   APP         = var.app
  #   Area        = var.bu
  #   Ambiente    = var.env
  # }
}
