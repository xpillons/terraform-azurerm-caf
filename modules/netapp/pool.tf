resource "azurerm_netapp_pool" "pool" {
  for_each = try(var.settings.pools, {})
  name = each.value.name
  account_name = azurerm_netapp_account.account.name
  resource_group_name = azurerm_netapp_account.account.resource_group_name
  location = azurerm_netapp_account.account.location
  service_level = try(each.value.service_level, "Standard")
  size_in_tb = try(each.value.size_in_tb, 4)
  tags = merge(var.base_tags, try(each.value.tags, {}))
}
