resource "azurerm_netapp_volume" "volume" {
  for_each = var.settings.pools.volumes
  name = each.value.name
  resource_group_name = azurerm_netapp_account.account.resource_group_name
  location = azurerm_netapp_account.account.location
  account_name = azurerm_netapp_account.account.name
  volume_path = each.value.volume_path
  pool_name = azurerm_netapp_pool.pool[each.key].name
  service_level = azurerm_netapp_pool.pool[each.key].service_level
  protocols = try(each.value.protocols, [])
  #subnet_id = try(var.vnets[var.client_config.landingzone_key][each.value.vnet_key].subnets[each.value.subnet_key].id, var.vnets[each.value.lz_key][each.value.vnet_key].subnets[each.value.subnet_key].id)
  subnet_id = try(var.vnets[each.value.vnet_key].specialsubnets[each.value.subnet_key].id, var.vnets[each.value.lz_key][each.value.vnet_key].specialsubnets[each.value.subnet_key].id)
  storage_quota_in_gb = try(each.value.size_in_tb, 100)
  #export_policy_rule  # need to be implemented
  tags = merge(var.base_tags, try(each.value.tags, {}))
}
