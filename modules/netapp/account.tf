# resource "azurecaf_name" "account" {
#   name          = var.settings.name
#   resource_type = "azurerm_netapp_account"
#   prefixes      = [var.global_settings.prefix]
#   random_length = var.global_settings.random_length
#   clean_input   = true
#   passthrough   = var.global_settings.passthrough
#   use_slug      = var.global_settings.use_slug
# }

resource "azurerm_netapp_account" "account" {
  #name = azurecaf_name.account.result
  name = var.settings.name
  resource_group_name = var.resource_group_name
  location = var.location
}

