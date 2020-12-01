app_service_plans = {
  asp1 = {
    resource_group_key = "rg_region1"
    name               = "asp-simple"

    sku = {
      tier = "Standard"
      size = "S1"
    }
  }
}

app_services = {
  webapp1 = {
    resource_group_key   = "rg_region1"
    name                 = "webapp1-simple"
    app_service_plan_key = "asp1"

    settings = {
      enabled = true
    }
  }
  webapp2 = {
    resource_group_key   = "rg_region1"
    name                 = "webapp2-simple"
    app_service_plan_key = "asp1"

    settings = {
      enabled = true
    }
  }
}