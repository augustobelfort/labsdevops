# locals {
#   disks_to_create = flatten([
#     for key, value in var.vm : [
#       for index, val in value.disk : {
#         nome_vm      = value.name
#         name         = val.name
#         disk_size_gb = val.disk_size_gb
#         lun          = val.lun
#       }
#     ]
#   ])
# }