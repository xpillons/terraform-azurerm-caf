global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}

resource_groups = {
  er = {
    name = "example-express-route-re1"
  }
}

vnets = {
  vnet_er = {
    resource_group_key = "er"
    vnet = {
      name          = "test-vn"
      address_space = ["10.2.0.0/16"]
    }
    specialsubnets = {
      GatewaySubnet = {
        name = "GatewaySubnet"  # must be named GatewaySubnet
        cidr = ["10.2.1.0/24"]
      }
    }
    subnets = {} 
    }
  }

public_ip_addresses = {
  vngw_pip = {
    name                    = "vngw_pip1"
    resource_group_key      = "er"
    sku                     = "Standard"  
    # Note: For UltraPerformance ExpressRoute Virtual Network gateway, the associated Public IP needs to be sku "Basic" not "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}

virtual_network_gateways = {
  gateway1 = {
   name = "mygateway"
   resource_group_key = "er"
   #supports only ExpressRoute at this time. VPN type is coming soon
   type = "ExpressRoute" 
   sku = "Standard"
   # enable active_active only with UltraPerformance and HighPerformance SKUs
   active_active = false
   # enable_bpg defaults to false. If set, true, input the necessary parameters as well.
   enable_bgp = false 
   ip_configuration = {
       ipconfig_name = "gatewayIp"
       public_ip_address_key = "vngw_pip"
       lz_key = "examples"
       vnet_key = "vnet_er"
       subnet_key = "GatewaySubnet"
       private_ip_address_allocation  = "Dynamic"
     }
   }
   }