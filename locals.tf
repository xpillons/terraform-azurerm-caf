locals {

  prefix = lookup(var.global_settings, "prefix", null) == null ? random_string.prefix.result : var.global_settings.prefix

  global_settings = {
    prefix             = local.prefix
    prefix_with_hyphen = local.prefix == "" ? "" : "${local.prefix}-"
    prefix_start_alpha = local.prefix == "" ? "" : "${random_string.alpha1.result}${local.prefix}"
    default_region     = lookup(var.global_settings, "default_region", "region1")
    environment        = lookup(var.global_settings, "environment", var.environment)
    random_length      = try(var.global_settings.random_length, 0)
    regions            = var.global_settings.regions
    passthrough        = try(var.global_settings.passthrough, false)
    inherit_tags       = try(var.global_settings.inherit_tags, false)
    use_slug           = try(var.global_settings.use_slug, true)
  }

  compute = {
    aks_clusters               = try(var.compute.aks_clusters, {})
    availability_sets          = try(var.compute.availability_sets, {})
    azure_container_registries = try(var.compute.azure_container_registries, {})
    bastion_hosts              = try(var.compute.bastion_hosts, {})
    proximity_placement_groups = try(var.compute.proximity_placement_groups, {})
    virtual_machines           = try(var.compute.virtual_machines, {})
  }

  storage = {
    netapp_accounts        = try(var.storage.netapp_accounts, {})
    storage_account_blobs = try(var.storage.storage_account_blobs, {})
  }

  security = {
    keyvault_certificates         = try(var.security.keyvault_certificates, {})
    keyvault_certificate_requests = try(var.security.keyvault_certificate_requests, {})
  }

  networking = {
    application_gateways                                    = try(var.networking.application_gateways, {})
    application_gateway_applications                        = try(var.networking.application_gateway_applications, {})
    azurerm_firewalls                                       = try(var.networking.azurerm_firewalls, {})
    azurerm_firewall_application_rule_collection_definition = try(var.networking.azurerm_firewall_application_rule_collection_definition, {})
    azurerm_firewall_nat_rule_collection_definition         = try(var.networking.azurerm_firewall_nat_rule_collection_definition, {})
    azurerm_firewall_network_rule_collection_definition     = try(var.networking.azurerm_firewall_network_rule_collection_definition, {})
    azurerm_routes                                          = try(var.networking.azurerm_routes, {})
    ddos_services                                           = try(var.networking.ddos_services, {})
    dns_zones                                               = try(var.networking.dns_zones, {})
    express_route_circuits                                  = try(var.networking.express_route_circuits, {})
    express_route_circuit_authorizations                    = try(var.networking.express_route_circuit_authorizations, {})
    front_doors                                             = try(var.networking.front_doors, {})
    front_door_waf_policies                                 = try(var.networking.front_door_waf_policies, {})
    local_network_gateways                                  = try(var.networking.local_network_gateways, {})
    network_security_group_definition                       = try(var.networking.network_security_group_definition, {})
    network_watchers                                        = try(var.networking.network_watchers, {})
    private_dns                                             = try(var.networking.private_dns, {})
    public_ip_addresses                                     = try(var.networking.public_ip_addresses, {})
    route_tables                                            = try(var.networking.route_tables, {})
    vhub_peerings                                           = try(var.networking.vhub_peerings, {})
    virtual_network_gateways                                = try(var.networking.virtual_network_gateways, {})
    virtual_network_gateway_connections                     = try(var.networking.virtual_network_gateway_connections, {})
    virtual_wans                                            = try(var.networking.virtual_wans, {})
    vnet_peerings                                           = try(var.networking.vnet_peerings, {})
  }

  database = {
    azurerm_redis_caches              = try(var.database.azurerm_redis_caches, {})
    cosmos_dbs                        = try(var.database.cosmos_dbs, {})
    databricks_workspaces             = try(var.database.databricks_workspaces, {})
    machine_learning_workspaces       = try(var.database.machine_learning_workspaces, {})
    mariadb_servers                   = try(var.database.mariadb_servers, {})
    mariadb_databases                 = try(var.database.mariadb_databases, {})
    mssql_servers                     = try(var.database.mssql_servers, {})
    mssql_managed_instances           = try(var.database.mssql_managed_instances, {})
    mssql_managed_instances_secondary = try(var.database.mssql_managed_instances_secondary, {})
    mssql_databases                   = try(var.database.mssql_databases, {})
    mssql_managed_databases           = try(var.database.mssql_managed_databases, {})
    mssql_managed_databases_restore   = try(var.database.mssql_managed_databases_restore, {})
    mssql_elastic_pools               = try(var.database.mssql_elastic_pools, {})
    mssql_failover_groups             = try(var.database.mssql_failover_groups, {})
    mssql_mi_failover_groups          = try(var.database.mssql_mi_failover_groups, {})
    mssql_mi_administrators           = try(var.database.mssql_mi_administrators, {})
    mysql_servers                     = try(var.database.mysql_servers, {})
    mysql_databases                   = try(var.database.mysql_databases, {})
    postgresql_servers                = try(var.database.postgresql_servers, {})
    synapse_workspaces                = try(var.database.synapse_workspaces, {})
  }

  client_config = {
    client_id               = data.azurerm_client_config.current.client_id
    tenant_id               = var.tenant_id == null ? data.azurerm_client_config.current.tenant_id : var.tenant_id
    subscription_id         = data.azurerm_client_config.current.subscription_id
    object_id               = local.object_id
    logged_aad_app_objectId = local.object_id
    logged_user_objectId    = local.object_id
    landingzone_key         = var.current_landingzone_key
  }

  object_id = coalesce(var.logged_user_objectId, var.logged_aad_app_objectId, try(data.azurerm_client_config.current.object_id, null), try(data.azuread_service_principal.logged_in_app.0.object_id, null))

  webapp = {
    app_services                 = try(var.webapp.app_services, {})
    app_service_environments     = try(var.webapp.app_service_environments, {})
    app_service_plans            = try(var.webapp.app_service_plans, {})
    azurerm_application_insights = try(var.webapp.azurerm_application_insights, {})
  }

  shared_services = {
    automations     = try(var.shared_services.automations, {})
    monitoring      = try(var.shared_services.monitoring, {})
    recovery_vaults = try(var.shared_services.recovery_vaults, {})
  }

  enable = {
    bastion_hosts    = try(var.enable.bastion_hosts, true)
    virtual_machines = try(var.enable.virtual_machines, true)
  }

}