

#
# Private endpoint
#

module private_endpoint {
  source   = "../../networking/private_endpoint"
  for_each = var.private_endpoints

  resource_id         = azurerm_mysql_server.mysql.id
  name                = try(format("%s-to-%s-%s", each.value.name, each.value.vnet_key, each.value.subnet_key), format("%s-to-%s-%s-%s", each.value.name, each.value.remote_tfstate.lz_key, each.value.vnet_key, each.value.subnet_key))
  location            = var.resource_groups[each.value.resource_group_key].location
  resource_group_name = var.resource_groups[each.value.resource_group_key].name
  subnet_id           = try(var.vnets[each.value.vnet_key].subnets[each.value.subnet_key].id, var.vnets[each.value.lz_key].vnets[each.value.vnet_key].subnets[each.value.subnet_key].id)
  settings            = each.value
  global_settings     = var.global_settings
  base_tags           = local.tags
}