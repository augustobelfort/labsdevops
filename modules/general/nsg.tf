resource "azurerm_network_security_group" "nsg" {
  depends_on          = [azurerm_resource_group.RG]
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags

  lifecycle {
    ignore_changes = [tags["Criacao"], tags["Safra"]]
  }
}

resource "azurerm_subnet_network_security_group_association" "ass-nsg" {
  count = var.has_windows ? 1 : 0

  subnet_id                 = azurerm_subnet.subnet[0].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "ass-nsg-out" {
  count = var.has_windows && var.has_subnet_out ? 1 : 0

  subnet_id                 = azurerm_subnet.subnet_out[0].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "ass-nsg-lx" {
  count = var.has_linux ? 1 : 0

  subnet_id                 = azurerm_subnet.subnet_lx[0].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "ass-nsg-out-lx" {
  count = var.has_linux && var.has_subnet_out ? 1 : 0

  subnet_id                 = azurerm_subnet.subnet_out_lx[0].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "ass-nsg-pod" {
  count = var.has_subnet_pod ? 1 : 0

  subnet_id                 = azurerm_subnet.subnet_pod[0].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
