module "caf" {
  source = "../../../../"

  global_settings             = var.global_settings
  diagnostic_storage_accounts = var.diagnostic_storage_accounts
  resource_groups             = var.resource_groups
  storage_accounts            = var.storage_accounts
  keyvaults                   = var.keyvaults
  managed_identities          = var.managed_identities
  role_mapping                = var.role_mapping

  storage = {
    netapp_accounts = var.netapp_accounts
  }

  networking = {
    vnets                             = var.vnets
    network_security_group_definition = var.network_security_group_definition
    public_ip_addresses               = var.public_ip_addresses
  }
}
