resource "azurerm_user_assigned_identity" "identity" {
  depends_on          = [resource.azurerm_resource_group.RG]
  resource_group_name = var.rg_name
  location            = var.location
  name                = var.identity_name
  tags                = var.tags

  lifecycle {
    ignore_changes = [tags["Criacao"], tags["Safra"]]
  }
}