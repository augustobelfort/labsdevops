# Interface de rede
resource "azurerm_network_interface" "vm-nic" {
  for_each = { for key in var.vm : key.name => key }

  name                = lower("nic-${each.value.name}")
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags

  lifecycle {
    ignore_changes = [tags["Criacao"], tags["Safra"], tags["FinOps"]]
  }

  ip_configuration {
    name                          = "nic-cfg-${each.value.name}"
    subnet_id                     = data.azurerm_subnet.subnet_lx.id
    primary                       = true
    private_ip_address_allocation = var.private_ip_allocation
    private_ip_address            = each.value.private_ip_address
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = { for key in var.vm : key.name => key }

  name                  = each.value.name #colocar nas variáveis o padrão de nomenclatura para LX
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.vm-nic[each.key].id]
  size                  = each.value.size #colocar link nas variáveis para os tamanhos;
  zone                  = var.vm_zone
  tags                  = var.tags
  admin_username        = var.user_default
  admin_password        = var.admin_password #tem que ver se tem
  disable_password_authentication = false #defaults to true; if true, at least one 'admin_ssh_key' must be specified 

  lifecycle {
    ignore_changes = [tags["Criacao"], tags["Safra"], tags["FinOps"]]
  }

  provision_vm_agent = true

  # source_image_id = var.source_image

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_disk {
    name                 = lower(join("-", [each.value.name, "os-disk"]))
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = each.value.disk_size_os_gb
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.sa.primary_blob_endpoint
  }
}

# resource "azurerm_managed_disk" "vm-md" {
#   count = length(local.disks_to_create)

#   name                 = local.disks_to_create[count.index].name
#   location             = var.location
#   resource_group_name  = var.rg_name
#   storage_account_type = "StandardSSD_LRS"
#   create_option        = "Empty"
#   disk_size_gb         = local.disks_to_create[count.index].disk_size_gb
#   zone                 = var.md_zones
#   tags                 = var.tags

#   lifecycle {
#     ignore_changes = [tags["Cricao"], tags["Safra"]]
#   }
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "mda" {
#   for_each = { for disk in local.disks_to_create : "${disk.nome_vm}-${disk.name}" => disk }

#   managed_disk_id    = azurerm_managed_disk.vm-md[each.value.lun].id
#   virtual_machine_id = azurerm_windows_virtual_machine.vm[each.value.nome_vm].id
#   lun                = each.value.lun
#   caching            = "ReadWrite"
# }