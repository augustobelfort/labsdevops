data "azurerm_subnet" "subnet_lx" {
  name                 = var.subnet_name_lx
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_vnet_name
}

################### PRIVATE ENDPOINT BLOB BKP ####################

resource "azurerm_private_endpoint" "pep_bkp" {
  name                = var.private_endpoint_sa_bkp_name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = data.azurerm_subnet.subnet_lx.id
  tags                = var.tags

  lifecycle {
    ignore_changes = [tags["Criacao"], tags["Safra"], tags["FinOps"]]
  }

  private_dns_zone_group {
    name                 = "privatelink.blob.core.windows.net"
    private_dns_zone_ids = ["/subscriptions/5aed6087-9cb8-4faa-a252-b4108b10a424/resourceGroups/network-infra-csc-prd-rg/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
  }

  private_service_connection {
    name                           = var.private_endpoint_sa_bkp_name
    private_connection_resource_id = azurerm_storage_account.sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}