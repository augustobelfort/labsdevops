resource "azurerm_resource_group" "RG" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags

  lifecycle {
    ignore_changes = [tags["Criacao"], tags["Safra"]]
  }
}

resource "azurerm_role_assignment" "rbac_rg" {
  scope                = azurerm_resource_group.RG.id
  role_definition_name = "Contributor"
  principal_id         = "f1200a56-df26-42fc-b1c1-587d487d3806"
  depends_on = [
    azurerm_resource_group.RG
  ]
}

resource "azurerm_role_assignment" "rbac_rg_owner" {
  scope                = azurerm_resource_group.RG.id
  role_definition_name = "Owner"
  principal_id         = "f1200a56-df26-42fc-b1c1-587d487d3806"
  depends_on = [
    azurerm_resource_group.RG
  ]
}