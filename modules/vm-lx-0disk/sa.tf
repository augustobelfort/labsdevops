# Storage Account para armazenar Diagnosticos das VMs durante o boot. Usado para troubleshooting
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_replication_type = var.storage_account_replication_type
  account_tier             = var.storage_account_tier
  min_tls_version          = "TLS1_2"
  tags                     = var.tags

  lifecycle {
    ignore_changes = [tags["Criacao"], tags["Safra"], tags["FinOps"]]
  }
}