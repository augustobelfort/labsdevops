resource "azurerm_subnet" "subnet" {
  count = var.has_windows ? 1 : 0

  name                                           = var.subnet_name
  virtual_network_name                           = var.vnet_name
  resource_group_name                            = var.rg_vnet_name
  address_prefixes                               = var.subnet_prefixes
  service_endpoints                              = var.subnet_service_endpoints
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "subnet_out" {
  count = var.has_windows && var.has_subnet_out ? 1 : 0

  name                 = var.subnet_name_out
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_vnet_name
  address_prefixes     = var.subnet_prefixes_out
  service_endpoints    = var.subnet_service_endpoints

  delegation {
    name = var.delegation_name_out

    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }
}

resource "azurerm_subnet" "subnet_lx" {
  count = var.has_linux ? 1 : 0

  name                                           = var.subnet_name_lx
  virtual_network_name                           = var.vnet_name
  resource_group_name                            = var.rg_vnet_name
  address_prefixes                               = var.subnet_prefixes_lx
  service_endpoints                              = var.subnet_service_endpoints
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "subnet_out_lx" {
  count = var.has_linux && var.has_subnet_out ? 1 : 0

  name                 = var.subnet_name_out_lx
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_vnet_name
  address_prefixes     = var.subnet_prefixes_out_lx
  service_endpoints    = var.subnet_service_endpoints

  delegation {
    name = var.delegation_name_out

    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }
}

resource "azurerm_subnet" "subnet_pod" {
  count = var.has_subnet_pod ? 1 : 0

  name                                           = var.subnet_name_pod
  virtual_network_name                           = var.vnet_name
  resource_group_name                            = var.rg_vnet_name
  address_prefixes                               = var.subnet_prefixes_pod
  service_endpoints                              = var.subnet_service_endpoints
  enforce_private_link_endpoint_network_policies = true

  lifecycle {
    ignore_changes = [
      delegation,
    ]
  }
}

data "azurerm_route_table" "rt-rfc" {
  name                = var.route_table_name
  resource_group_name = "RG_NETWORK_ARQUITETURA_DEV_EUS2"
  #resource_group_name = var.rg_vnet_name
}

resource "azurerm_subnet_route_table_association" "ass-rt" {
  count = var.has_windows ? 1 : 0

  subnet_id      = azurerm_subnet.subnet[0].id
  route_table_id = data.azurerm_route_table.rt-rfc.id
  depends_on     = [resource.azurerm_subnet.subnet]
}

resource "azurerm_subnet_route_table_association" "ass-rt-out" {
  count = var.has_windows && var.has_subnet_out ? 1 : 0

  subnet_id      = azurerm_subnet.subnet_out[0].id
  route_table_id = data.azurerm_route_table.rt-rfc.id
  depends_on     = [resource.azurerm_subnet.subnet_out]
}

resource "azurerm_subnet_route_table_association" "ass-rt-lx" {
  count = var.has_linux ? 1 : 0

  subnet_id      = azurerm_subnet.subnet_lx[0].id
  route_table_id = data.azurerm_route_table.rt-rfc.id
  depends_on     = [resource.azurerm_subnet.subnet_lx]
}

resource "azurerm_subnet_route_table_association" "ass-rt-out-lx" {
  count = var.has_linux && var.has_subnet_out ? 1 : 0

  subnet_id      = azurerm_subnet.subnet_out_lx[0].id
  route_table_id = data.azurerm_route_table.rt-rfc.id
  depends_on     = [resource.azurerm_subnet.subnet_out_lx]
}

resource "azurerm_subnet_route_table_association" "ass-rt-pod" {
  count          = var.has_subnet_pod ? 1 : 0
  subnet_id      = azurerm_subnet.subnet_pod[0].id
  route_table_id = data.azurerm_route_table.rt-rfc.id
  depends_on     = [resource.azurerm_subnet.subnet_pod]
}
